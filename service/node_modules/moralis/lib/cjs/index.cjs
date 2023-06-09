'use strict';

Object.defineProperty(exports, '__esModule', { value: true });

var streams$1 = require('@moralisweb3/streams');
var apiUtils$1 = require('@moralisweb3/api-utils');
var auth$1 = require('@moralisweb3/auth');
var commonEvmUtils$1 = require('@moralisweb3/common-evm-utils');
var evmApi$1 = require('@moralisweb3/evm-api');
var aptosApi$1 = require('@moralisweb3/aptos-api');
var commonSolUtils$1 = require('@moralisweb3/common-sol-utils');
var solApi$1 = require('@moralisweb3/sol-api');
var commonCore = require('@moralisweb3/common-core');

// Core
var core = commonCore.Core.create();
// Utility modules
var commonEvmUtils = commonEvmUtils$1.CommonEvmUtils.create(core);
var commonSolUtils = commonSolUtils$1.CommonSolUtils.create(core);
var apiUtils = apiUtils$1.ApiUtils.create(core);
// Feature modules
var auth = auth$1.Auth.create(core);
var streams = streams$1.Streams.create(core);
var evmApi = evmApi$1.EvmApi.create(core);
var solApi = solApi$1.SolApi.create(core);
var aptosApi = aptosApi$1.AptosApi.create(core);
// Register all Moralis modules to Core
core.registerModules([commonEvmUtils, commonSolUtils, auth, apiUtils, evmApi, solApi, streams]);
commonCore.CoreProvider.setDefault(core);
var Moralis = {
    Core: core,
    Auth: auth,
    Streams: streams,
    EvmApi: evmApi,
    SolApi: solApi,
    AptosApi: aptosApi,
    EvmUtils: commonEvmUtils,
    SolUtils: commonSolUtils,
    start: function (config) {
        return core.start(config);
    },
};

exports.default = Moralis;
