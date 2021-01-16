/**
 * Example for building and publishing worker
 * with the WASM modules
 * 
 * Expectes script output to worker/scripts.js
 */

import fetch from "node-fetch"
import FormData from "form-data"
import fs from "fs"
import cp from "child_process"

const metadata = {
    "body_part": "script",
    "bindings": []
}

cp.execSync("npx wrangler build", {stdio:"inherit"})

const CF_ACCOUNT_ID = process.env["CF_ACCOUNT_ID"]
const CF_API_TOKEN = process.env["CF_API_TOKEN"]
const SCRIPT_NAME = "example"

let formdata = new FormData()

formdata.append("script", fs.createReadStream("worker/script.js"))
formdata.append("type", "application/javascript")

function wasm(name)
{
    formdata.append(`${name}_wasm`, fs.createReadStream(`node_modules/cf-hash-wasm/dist/wasm/${name}.wasm`))
    formdata.append("type", "application/wasm")
    metadata.bindings.push({
        "type": "wasm_module",
        "name": `${name}_WASM_MODULE`,
        "part": `${name}_wasm`
    })
}

wasm("argon2")
wasm("blake2b")
// wasm("blake2s")
// wasm("sha3")
// wasm("sha256")
// wasm("sha512")
// wasm("crc32")
// wasm("md4")

formdata.append("metadata", JSON.stringify(metadata))
formdata.append("type", "application/json")

const response = await fetch(`https://api.cloudflare.com/client/v4/accounts/${CF_ACCOUNT_ID}/workers/scripts/${SCRIPT_NAME}`, {
    method: "PUT",
    headers: {
        "Authorization": `Bearer ${CF_API_TOKEN}`
    },
    body: formdata
})
if(!response.ok)
{
    console.error("Failed to publish", await response.text())
}
else console.log("Published")