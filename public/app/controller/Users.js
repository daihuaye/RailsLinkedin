Ext.define('RestPro.controller.Users', {
	extend: 'Ext.app.Controller',

	config: {
		profile: Ext.os.deviceType.toLowerCase()
	},
	
	views : [
		'Main'
	],
	
	stores: ['Menus'],
	
	refs: [
		{
			ref	: 'main',
			selector : 'mainview',
			autoCreate: true,
			xtype : 'mainview'
		}
	],
	
	init: function() {
		
	},
	
	updateProfile: function (profile) {
		this.getMain();
	}
});