'use strict';

var commonAptosUtils = require('@moralisweb3/common-aptos-utils');



Object.keys(commonAptosUtils).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonAptosUtils[k]; }
	});
});
