
use microhttpd
import microhttpd/microhttpd

import os/Time

running := true

handleRequest: func (cls: Pointer,
    connection: MHDConnection,
    url: CString, method: CString,
    _version: CString, uploadData: CString, uploadDataSize: SizeT, conCls: Pointer) -> Int {
    page := "<html><body>Hello, browser!</body></html>"
    response := MHDResponse createFromBuffer(page size, page toCString(), MHDResponseMemoryMode persistent)
    ret := connection queueResponse(200, response)
    response destroy()
    running = false
    ret
}

main: func {
    port := 4141

    daemon := MHDDaemon start(MHDFlag selectInternally, port, null, null,
        handleRequest&, null, MHDOption end)

    "Listening on port #{port}" println()

    while (running) {
        Time sleepMilli(100)
    }

    daemon stop()

}

