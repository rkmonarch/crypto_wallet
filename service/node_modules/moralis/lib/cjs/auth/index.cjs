'use strict';

var auth = require('@moralisweb3/auth');



Object.keys(auth).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return auth[k]; }
	});
});
