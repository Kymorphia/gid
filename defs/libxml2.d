//!gir libxml2-2.0
//!info description "D binding for the libxml2 library - "
//!info homepage https://github.com/GNOME/libxml2
//!info docs https://www.kymorphia.com/gid/gid~libxml2/

//# Change package name to just libxml2 rather than libxml22
//!info name libxml2

//# Include GLib for gid module
//!add repository '<include name="GLib" version="2.0"/>'

//# Delete dummy function (why is it even in the GIR file?)
//!del function[dummy]

//!set record[Node][opaque] 1
//!set record[Doc][opaque] 1
//!set record[NodePtr][pointer] 1
//!set record[DocPtr][pointer] 1
//!set record[NsPtr][pointer] 1
//!set record[TextWriter][pointer] 1
//!set record[TextReader][pointer] 1
