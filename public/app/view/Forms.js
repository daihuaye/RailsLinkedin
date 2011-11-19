Ext.define('RestPro.view.Forms', {
	extend: 'Ext.tab.Panel',
	
	requires: [
    	'Ext.form.Panel',
    	'Ext.form.FieldSet'
	],
	
	config: {
		title: 'New User',
		xtype: 'formpanel',
		id   ; 'newuserform',
		layout: {
			type: 'vbox',
			align: 'stretch'
		},
		items: [
			{
				xtype: 'fieldset',
				title: 'Login/Sign Up',
				instructions: 'Please enter the information above.',
				defaults: {
					labelWidth: '35%'
				},
				items: [
					{
						xtype		: 'textfield',
						name		: 'name',
						label		: 'Name',
						placeHolder	: 'Demo',
						autoCapitalize: true,
						required	: true,
						clearIncon	: true
					},
					{
						xtype		: 'passwordfield',
						name		: 'password',
						label		: 'Password'
					},
					{
						xtype		: 'panel',
						defaults	: {
							xtype: 'button',
							style: 'margin: 0.1em',
							flex: 1
						},
						layout: {
							type: 'hbox'
						},
						items: [
							{
								text: 'Reset',
								handler: function() {
									Ext.getCmp('newuserform').reset();
								}
							},
							{
								text: 'save',
								handler: function() {
									
								}
							}
						]
					}
				]
			}
		]
	}
});