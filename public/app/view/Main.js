if (Ext.os.deviceType == 'Phone') {
	
} else {
	Ext.define('RestPro.view.Main',{
		extend: 'Ext.tab.Panel',
		
		requires: [
	    	'Ext.form.Panel',
	    	'Ext.form.FieldSet'
		],
		
		config: {
			fullscreen: true,
			ui: 'light',
			tabBar: {
				docked: 'bottom',
				layout: {
					pack: 'center'
				}
			},
			defaults: {
				scrollable: true
			},
			items: [
	            {
	                title: 'About',
	                html: '<h1>RestPro Demo</h1><p>Docking tabs to the bottom will automatically change their style. The tabs below are type="light", though the standard type is dark. Badges (like the 4 &amp; Long title below) can be added by setting <code>badgeText</code> when creating a tab/card or by using <code>setBadge()</code> on the tab later.</p>',
	                iconCls: 'info',
	                cls: 'card1'
	            },
	            {
	                title: 'Favorites',
	                html: '<h1>Favorites Card</h1>',
	                iconCls: 'favorites',
	                cls: 'card2',
	                badgeText: '4'
	            },
	            {
	                title: 'Downloads',
	                id: 'tab3',
	                html: '<h1>Downloads Card</h1>',
	                // badgeText: 'Text can go here too, but it will be cut off if it is too long.',
	                cls: 'card3',
	                iconCls: 'download'
	            },
	            {
	                title: 'Settings',
	                html: '<h1>Settings Card</h1>',
	                cls: 'card4',
	                iconCls: 'settings'
	            },
	            {
					title: 'New User',
	                cls: 'card6',
	                iconCls: 'user',
					xtype: 'formpanel',
					id   : 'newuserform',
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
								}
							]
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
									text: 'login',
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
}
