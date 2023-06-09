'use strict';

var commonEvmUtils = require('@moralisweb3/common-evm-utils');



Object.keys(commonEvmUtils).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonEvmUtils[k]; }
	});
});
