Ext.Loader.setConfig({ enabled: true });

Ext.application({
    name: 'RestPro',
    
    controllers: ['Users'],
    models     : ['User']
});
