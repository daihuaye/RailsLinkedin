Ext.define('RestPro.model.User', {
    extend: 'Ext.data.Model',

	fields: [
		{name: 'id', type: 'id'}, 
		{name: 'name', type: "string"}, 
		{name: 'password', type: "string"}
	]
	
	// proxy: {
	// 	type: 'rest',
	// 	url: '/users',
	// 	format: 'json',
	// 	reader: {
	// 		type: 'json',
	// 		root: 'data',
	// 		record: 'person'
	// 	}
	// }
});
