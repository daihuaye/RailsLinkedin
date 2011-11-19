class PeopleController < ApplicationController
  def index
    # get your api keys at https://www.linkedin.com/secure/developer
    client = LinkedIn::Client.new("n045sa9y9a16", "in2W00HAuBeknE4L")
    request_token = client.request_token(:oauth_callback => 
                                      "http://#{request.host_with_port}/people/callback")
    session[:rtoken] = request_token.token
    session[:rsecret] = request_token.secret
    
    redirect_to client.request_token.authorize_url
  end
  
  def show
    client = LinkedIn::Client.new("n045sa9y9a16", "in2W00HAuBeknE4L")
    if session[:atoken].nil?
      pin = params[:oauth_verifier]
      atoken, asecret = client.authorize_from_request(session[:rtoken], session[:rsecret], pin)
      session[:atoken] = atoken
      session[:asecret] = asecret
    else
      client.authorize_from_access(session[:atoken], session[:asecret])
    end
    
    @profile = client.profile(:public => true)
    
    if @profile
      @person = Person.find_or_create_by_first_name_and_last_name(@profile.first_name, @profile.last_name)
      @person.first_name        = @profile.first_name
      @person.last_name         = @profile.last_name
      @person.headline          = @profile.headline
      @person.industry          = @profile.industry
      @person.summary           = @profile.summary,
      @person.interests         = @profile.interests
      @person.picture_url       = @profile.picture_url
      @person.public_profile_url= @profile.public_profile_url
      @person.location          = @profile.location.name
      @person.country           = @profile.location.country.code
      @person.honors            = @profile.honors
      @person.associations      = @profile.associations
      
      populate_child_models(@profile, @person, client)
      if @person.save
        logger.debug "person is created successfully"
      end
    end
    
    respond_to do |format|
      format.html  { redirect_to "http://localhost:3000/people/mailbox", :notice => "success" }
      format.json  { render :json => {:success => true, :data => @person} }
    end
  end
    
  def populate_child_models(profile, person, client)
    if profile.educations.total.to_i > 0
      profile.educations.all.each do |edu|
          @education = person.educations.find_or_create_by_school_name(edu.school_name)
          @education.linkedin_education_id = edu.id
          @education.school_name = edu.school_name
          @education.degree = edu.degree
          @education.field_of_study = edu.field_of_study
          @education.start_date = check_date(edu.start_date)
          @education.end_date = check_date(edu.end_date)
          @education.notes = edu.notes
          @education.save
      end
    end
    
    if profile.positions.total.to_i > 0
      profile.positions.all.each do |pos|
        @position = person.positions.find_or_create_by_company(pos.company.name)
        @position.linkedin_position_id = pos.id
        @position.title = pos.title
        @position.summary = pos.summary
        @position.industry = pos.company.industry
        @position.start_date = check_date(pos.start_date)
        @position.is_current = pos.is_current
        if pos.is_current
          @position.end_date = nil
        else
          @position.end_date = check_date(pos.end_date)
        end
        @position.company = pos.company.name
        @position.save
      end
    end
    
    if profile.connections.total.to_i > 0
      @connections = client.connections
      @connections.all.each do |con|
        @connection = person.connections.find_or_create_by_member_id(con.id)
        @connection.member_id = con.id
        @connection.first_name = con.first_name
        @connection.last_name = con.last_name
        @connection.headline = con.headline
        @connection.location = con.location.name
        @connection.country = con.location.country.code
        @connection.industry = con.industry
        @connection.site_standard_profile_request = con.site_standard_profile_request.url
        @connection.picture_url = con.picture_url
        @connection.save
      end
    end
  end
  
  def check_date(date)
    newDate = Date.new
    if date.try(:year) != nil
      newDate = newDate.change(:year => date.year)
    end
    if date.try(:month) != nil
      newDate = newDate.change(:month => date.month)
    end
    return newDate
  end
end
