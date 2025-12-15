/// C types for arrowflight1 library
module arrowflight.c.types;

public import gid.basictypes;
public import arrow.c.types;

/** */
struct GAFlightCallOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightCallOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightClient
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightClientClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightClientOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightClientOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightCommandDescriptor
{
  /** */
  GAFlightDescriptor parentInstance;
}

/** */
struct GAFlightCommandDescriptorClass
{
  /** */
  GAFlightDescriptorClass parentClass;
}

/** */
struct GAFlightCriteria
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightCriteriaClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightDataStream
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightDataStreamClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightDescriptor
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightDescriptorClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightDoPutResult
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightDoPutResultClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightEndpoint
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightEndpointClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightInfo
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightInfoClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightLocation
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightLocationClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightMessageReader
{
  /** */
  GAFlightRecordBatchReader parentInstance;
}

/** */
struct GAFlightMessageReaderClass
{
  /** */
  GAFlightRecordBatchReaderClass parentClass;
}

/** */
struct GAFlightMetadataReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightMetadataReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightMetadataWriter
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightMetadataWriterClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightPathDescriptor
{
  /** */
  GAFlightDescriptor parentInstance;
}

/** */
struct GAFlightPathDescriptorClass
{
  /** */
  GAFlightDescriptorClass parentClass;
}

/** */
struct GAFlightRecordBatchReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightRecordBatchReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightRecordBatchStream
{
  /** */
  GAFlightDataStream parentInstance;
}

/** */
struct GAFlightRecordBatchStreamClass
{
  /** */
  GAFlightDataStreamClass parentClass;
}

/** */
struct GAFlightRecordBatchWriter
{
  /** */
  GArrowRecordBatchWriter parentInstance;
}

/** */
struct GAFlightRecordBatchWriterClass
{
  /** */
  GArrowRecordBatchWriterClass parentClass;
}

/** */
struct GAFlightServable;

/** */
struct GAFlightServableInterface;

/** */
struct GAFlightServer
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerAuthHandler
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerAuthHandlerClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightServerAuthReader
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerAuthReaderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightServerAuthSender
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerAuthSenderClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightServerCallContext
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerCallContextClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightServerClass
{
  /** */
  GObjectClass parentClass;

  /**
      A virtual function to implement `ListFlights` API.
  */
  extern(C) GList* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightCriteria* criteria, GError** _err) listFlights;

  /** */
  extern(C) GAFlightInfo* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightDescriptor* request, GError** _err) getFlightInfo;

  /**
      A virtual function to implement `DoGet` API.
  */
  extern(C) GAFlightDataStream* function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightTicket* ticket, GError** _err) doGet;

  /**
      A virtual function to implement `DoPut` API.
  */
  extern(C) gboolean function(GAFlightServer* server, GAFlightServerCallContext* context, GAFlightMessageReader* reader, GAFlightMetadataWriter* writer, GError** _err) doPut;
}

/** */
struct GAFlightServerCustomAuthHandler
{
  /** */
  GAFlightServerAuthHandler parentInstance;
}

/** */
struct GAFlightServerCustomAuthHandlerClass
{
  /** */
  GAFlightServerAuthHandlerClass parentClass;

  /**
      Authenticates the client on initial connection. The server
        can send and read responses from the client at any time.
  */
  extern(C) void function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GAFlightServerAuthSender* sender, GAFlightServerAuthReader* reader, GError** _err) authenticate;

  /**
      Validates a per-call client token.
  */
  extern(C) GBytes* function(GAFlightServerCustomAuthHandler* handler, GAFlightServerCallContext* context, GBytes* token, GError** _err) isValid;
}

/** */
struct GAFlightServerOptions
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightServerOptionsClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightStreamChunk
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightStreamChunkClass
{
  /** */
  GObjectClass parentClass;
}

/** */
struct GAFlightStreamReader
{
  /** */
  GAFlightRecordBatchReader parentInstance;
}

/** */
struct GAFlightStreamReaderClass
{
  /** */
  GAFlightRecordBatchReaderClass parentClass;
}

/** */
struct GAFlightStreamWriter
{
  /** */
  GAFlightRecordBatchWriter parentInstance;
}

/** */
struct GAFlightStreamWriterClass
{
  /** */
  GAFlightRecordBatchWriterClass parentClass;
}

/** */
struct GAFlightTicket
{
  /** */
  GObject parentInstance;
}

/** */
struct GAFlightTicketClass
{
  /** */
  GObjectClass parentClass;
}

alias extern(C) void function(const(char)* name, const(char)* value, void* userData) GAFlightHeaderFunc;

