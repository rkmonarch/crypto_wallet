// const Moralis = require("moralis").default;
// const { EvmChain } = require("@moralisweb3/common-evm-utils");
import Moralis from 'moralis';
import { EvmChain } from "@moralisweb3/common-evm-utils";
import express, { response } from "express";
const app = express();

const moralis = async () => {
    await Moralis.start({
      apiKey: "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJub25jZSI6Ijg0MzBlMmQ4LThmYzgtNDNlOS04Y2RlLWRmZmM5MjYzYjVmYSIsIm9yZ0lkIjoiMjY5NTU5IiwidXNlcklkIjoiMjc0NDQ5IiwidHlwZUlkIjoiNDExZGIxNTUtN2ViMy00ZjEwLThiY2EtYWU1MWE5NGViMGI4IiwidHlwZSI6IlBST0pFQ1QiLCJpYXQiOjE2ODYyOTA5OTYsImV4cCI6NDg0MjA1MDk5Nn0.zMvIcGVYxBTFiNo4xPlDmhrz1Jbd9S-PBIxFK07-cBM",
    });
}

app.get('/', async (req, res) => {
    const address = req.query.address;
    const chain = req.query.chain;
    const response = await Moralis.EvmApi.balance.getNativeBalance({
      address,
      chain,
    });
    res.send(response.toJSON());
});


app.get('/nft', async (req, res) => {
    const address =req.query.address;
    const chain = req.query.chain;
    const response = await Moralis.EvmApi.nft.getWalletNFTs({
        address,
        chain,
      });
    console.log(response.toJSON());
    res.send(response.toJSON());
});
app.listen(3000, () => {
    moralis();

    console.log('Example app listening on port 3000!');
});
