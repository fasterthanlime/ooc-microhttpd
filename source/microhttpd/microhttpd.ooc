
use microhttpd
include microhttpd

MHDConnection: cover from struct MHD_Connection* {

    queueResponse: extern(MHD_queue_response) func (
        statusCode: UInt, response: MHDResponse) -> Int

    suspend: extern(MHD_suspend_connection) func
    resume: extern(MHD_resume_connection) func

}

MHDResponse: cover from struct MHD_Response* {

    createFromBuffer: extern(MHD_create_response_from_buffer) static func (
        size: SizeT, buffer: Pointer, responseMemoryMode: Int) -> This

    destroy: extern(MHD_destroy_response) func

}

MHDDaemon: cover from struct MHD_Daemon* {

    start: extern(MHD_start_daemon) static func (
        flags: UInt, port: UInt16,
        acceptPolicyHandler: Pointer, acceptPolicyHandlerData: Pointer,
        dataHandler: Pointer, dataHandlerData: Pointer,
        ap: Int) -> This

    stop: extern(MHD_stop_daemon) func
    run: extern(MHD_run) func

}

MHDRetCode: enum from Int {
    yes: extern(MHD_YES)
    no:  extern(MHD_NO)
}

MHDResponseMemoryMode: enum from Int {
    persistent: extern(MHD_RESPMEM_PERSISTENT)
    mustFree:   extern(MHD_RESPMEM_MUST_FREE)
    mustCopy:   extern(MHD_RESPMEM_MUST_COPY)
}

MHDFlag: enum from Int {
    noFlag:               extern(MHD_NO_FLAG)
    debug:                extern(MHD_USE_DEBUG)
    ssl:                  extern(MHD_USE_SSL)
    threadPerConnection:  extern(MHD_USE_THREAD_PER_CONNECTION)
    selectInternally:     extern(MHD_USE_SELECT_INTERNALLY)
    ipv6:                 extern(MHD_USE_IPv6)
    pedantic:             extern(MHD_USE_PEDANTIC_CHECKS)
    poll:                 extern(MHD_USE_POLL)
    pollInternally:       extern(MHD_USE_POLL_INTERNALLY)
    suppressDateNoClock:  extern(MHD_SUPPRESS_DATE_NO_CLOCK)
    noListenSocket:       extern(MHD_USE_NO_LISTEN_SOCKET)
    epoll:                extern(MHD_USE_EPOLL_LINUX_ONLY)
    epollInternally:      extern(MHD_USE_EPOLL_INTERNALLY_LINUX_ONLY)
    pipeForShutdown:      extern(MHD_USE_PIPE_FOR_SHUTDOWN)
    dualStack:            extern(MHD_USE_DUAL_STACK)
    epollTurbo:           extern(MHD_USE_EPOLL_TURBO)
    suspendResume:        extern(MHD_USE_SUSPEND_RESUME)
    tcpFastOpen:          extern(MHD_USE_TCP_FASTOPEN)
}

MHDOption: enum from Int {
    end: extern(MHD_OPTION_END)
    connectionMemoryLimit: extern(MHD_OPTION_CONNECTION_MEMORY_LIMIT)
    connectionLimit: extern(MHD_OPTION_CONNECTION_LIMIT)
    connectionTimeout: extern(MHD_OPTION_CONNECTION_TIMEOUT)

    notifyCompleted: extern(MHD_OPTION_NOTIFY_COMPLETED)
    perIPConnectionLimit: extern(MHD_OPTION_PER_IP_CONNECTION_LIMIT)
    sockAddr: extern(MHD_OPTION_SOCK_ADDR)
    uriLogCallback: extern(MHD_OPTION_URI_LOG_CALLBACK)

    httpsMemKey: extern(MHD_OPTION_HTTPS_MEM_KEY)
    httpsMemCert: extern(MHD_OPTION_HTTPS_MEM_CERT)
    httpsCredType: extern(MHD_OPTION_HTTPS_CRED_TYPE)
    httpsPriorities: extern(MHD_OPTION_HTTPS_PRIORITIES)

    listenSocket: extern(MHD_OPTION_LISTEN_SOCKET)
    externalLogger: extern(MHD_OPTION_EXTERNAL_LOGGER)
    threadPoolSize: extern(MHD_OPTION_THREAD_POOL_SIZE)
    array: extern(MHD_OPTION_ARRAY)
    unescapeCallback: extern(MHD_OPTION_UNESCAPE_CALLBACK)
    digestAuthRandom: extern(MHD_OPTION_DIGEST_AUTH_RANDOM)

    nonceNcSize: extern(MHD_OPTION_NONCE_NC_SIZE)
    threadStackSize: extern(MHD_OPTION_THREAD_STACK_SIZE)
    httpsMemTrust: extern(MHD_OPTION_HTTPS_MEM_TRUST)
    connectionMemoryIncrement: extern(MHD_OPTION_CONNECTION_MEMORY_INCREMENT)
    httpsCertCallback: extern(MHD_OPTION_HTTPS_CERT_CALLBACK)

    tcpFastOpenQueueSize: extern(MHD_OPTION_TCP_FASTOPEN_QUEUE_SIZE)
    httpsMemDHParams: extern(MHD_OPTION_HTTPS_MEM_DHPARAMS)
    listeningAddressReuse: extern(MHD_OPTION_LISTENING_ADDRESS_REUSE)
}

