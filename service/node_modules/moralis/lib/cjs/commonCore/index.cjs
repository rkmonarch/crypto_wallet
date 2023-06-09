'use strict';

var commonCore = require('@moralisweb3/common-core');



Object.keys(commonCore).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonCore[k]; }
	});
});
