'use strict';

var commonAuthUtils = require('@moralisweb3/common-auth-utils');



Object.keys(commonAuthUtils).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonAuthUtils[k]; }
	});
});
