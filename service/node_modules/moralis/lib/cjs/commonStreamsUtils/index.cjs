'use strict';

var commonStreamsUtils = require('@moralisweb3/common-streams-utils');



Object.keys(commonStreamsUtils).forEach(function (k) {
	if (k !== 'default' && !exports.hasOwnProperty(k)) Object.defineProperty(exports, k, {
		enumerable: true,
		get: function () { return commonStreamsUtils[k]; }
	});
});
