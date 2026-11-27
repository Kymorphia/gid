/// C types for libxml2 library
module gid.libxml2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/// GIR namespace of the binding (used to export D-defined GObject types to GIR)
enum string _gidGirNamespace = "libxml2";

/// GIR namespace version of the binding
enum string _gidGirVersion = "2.0";

/// C headers of the binding library (included by the C headers of D libraries using its types)
enum string[] _gidGirCIncludes = [];

/** */
@gidGir("Char")
struct xmlChar;

/** */
@gidGir("Doc")
struct xmlDoc;

/** */
alias xmlDocPtr = xmlDocPtr_st*;

struct xmlDocPtr_st;

/** */
@gidGir("Node")
struct xmlNode;

/** */
alias xmlNodePtr = xmlNodePtr_st*;

struct xmlNodePtr_st;

/** */
alias xmlNsPtr = xmlNsPtr_st*;

struct xmlNsPtr_st;

/** */
alias xmlTextReaderPtr = xmlTextReaderPtr_st*;

struct xmlTextReaderPtr_st;

/** */
alias xmlTextWriterPtr = xmlTextWriterPtr_st*;

struct xmlTextWriterPtr_st;

