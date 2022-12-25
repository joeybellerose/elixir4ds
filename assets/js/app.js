// If you want to use Phoenix channels, run `mix help phx.gen.channel`
// to get started and then uncomment the line below.
// import "./user_socket.js"

// You can include dependencies in two ways.
//
// The simplest option is to put them in assets/vendor and
// import them using relative paths:
//
//     import "../vendor/some-package.js"
//
// Alternatively, you can `npm install some-package --prefix assets` and import
// them using a path starting with the package name:
//
//     import "some-package"
//

// Include phoenix_html to handle method=PUT/DELETE in forms and buttons.
import "phoenix_html"
// Establish Phoenix Socket and LiveView configuration.
import { Socket } from "phoenix"
import { LiveSocket } from "phoenix_live_view"
import topbar from "../vendor/topbar"
import hljs from "./highlight.min.js"
import elixir from "./elixir.min.js"

hljs.registerLanguage('elixir', elixir);

let Hooks = {}
Hooks.Highlight = {
    mounted() {
        hljs.highlightAll();
    }
}

Hooks.Resize = {
    mounted() {
        // console.log(this.el.contentWindow.document.body.scrollHeight)
    }
}

// import hljs from 'https://unpkg.com/@highlightjs/cdn-assets@11.7.0/es/highlight.min.js';
// import elixir from 'https://unpkg.com/@highlightjs/cdn-assets@11.7.0/es/languages/elixir.min.js';
// hljs.registerLanguage('elxir', elixir);
// // const hljs = require("./highlight.min.js")

// // hljs.initHighlightingOnLoad();

// console.log(hljs)

let csrfToken = document.querySelector("meta[name='csrf-token']").getAttribute("content")
let liveSocket = new LiveSocket("/live", Socket, {
    params: { _csrf_token: csrfToken },
    hooks: Hooks,
    // dom: {
    //     onBeforeElUpdated(from, to) {
    //         if (from._x_dataStack) { hljs.highlightAll(); }
    //     }
    // },
})

// Show progress bar on live navigation and form submits
topbar.config({ barColors: { 0: "#29d" }, shadowColor: "rgba(0, 0, 0, .3)" })
window.addEventListener("phx:page-loading-start", info => topbar.delayedShow(200))
window.addEventListener("phx:page-loading-stop", info => topbar.hide())

// connect if there are any LiveViews on the page
liveSocket.connect()

// expose liveSocket on window for web console debug logs and latency simulation:
// >> liveSocket.enableDebug()
// >> liveSocket.enableLatencySim(1000)  // enabled for duration of browser session
// >> liveSocket.disableLatencySim()
window.liveSocket = liveSocket

