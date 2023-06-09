'use strict';

var commonSolUtils = require('@moralisweb3/common-sol-utils');



Object.keys(commonSolUtils).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonSolUtils[k]; }
	});
});
