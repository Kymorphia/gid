/// C types for libxml2 library
module gid.libxml2.c.types;

public import gid.core.basictypes;
public import gid.glib2.c.types;

/** */
struct xmlChar;

/** */
struct xmlDoc;

/** */
alias xmlDocPtr = xmlDocPtr_st*;

struct xmlDocPtr_st;

/** */
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

