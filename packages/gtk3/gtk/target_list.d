/// Module for [TargetList] class
module gtk.target_list;

import gdk.atom;
import gid.gid;
import gobject.boxed;
import gtk.c.functions;
import gtk.c.types;
import gtk.target_entry;
import gtk.text_buffer;
import gtk.types;

/**
    A #GtkTargetList-struct is a reference counted list
    of #GtkTargetPair and should be treated as
    opaque.
*/
class TargetList : gobject.boxed.Boxed
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? boxCopy : _cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gtk_target_list_get_type != &gidSymbolNotFound ? gtk_target_list_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TargetList self()
  {
    return this;
  }

  /**
      Creates a new #GtkTargetList from an array of #GtkTargetEntry.
  
      Params:
        targets = Pointer to an array
            of #GtkTargetEntry
      Returns: the new #GtkTargetList.
  */
  this(gtk.target_entry.TargetEntry[] targets = null)
  {
    GtkTargetList* _cretval;
    uint _ntargets;
    if (targets)
      _ntargets = cast(uint)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    _cretval = gtk_target_list_new(_targets, _ntargets);
    this(_cretval, Yes.Take);
  }

  /**
      Appends another target to a #GtkTargetList.
  
      Params:
        target = the interned atom representing the target
        flags = the flags for this target
        info = an ID that will be passed back to the application
  */
  void add(gdk.atom.Atom target, uint flags, uint info)
  {
    gtk_target_list_add(cast(GtkTargetList*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null, flags, info);
  }

  /**
      Appends the image targets supported by #GtkSelectionData to
      the target list. All targets are added with the same info.
  
      Params:
        info = an ID that will be passed back to the application
        writable = whether to add only targets for which GTK+ knows
            how to convert a pixbuf into the format
  */
  void addImageTargets(uint info, bool writable)
  {
    gtk_target_list_add_image_targets(cast(GtkTargetList*)this._cPtr, info, writable);
  }

  /**
      Appends the rich text targets registered with
      [gtk.text_buffer.TextBuffer.registerSerializeFormat] or
      [gtk.text_buffer.TextBuffer.registerDeserializeFormat] to the target list. All
      targets are added with the same info.
  
      Params:
        info = an ID that will be passed back to the application
        deserializable = if true, then deserializable rich text formats
                           will be added, serializable formats otherwise.
        buffer = a #GtkTextBuffer.
  */
  void addRichTextTargets(uint info, bool deserializable, gtk.text_buffer.TextBuffer buffer)
  {
    gtk_target_list_add_rich_text_targets(cast(GtkTargetList*)this._cPtr, info, deserializable, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Prepends a table of #GtkTargetEntry to a target list.
  
      Params:
        targets = the table of #GtkTargetEntry
  */
  void addTable(gtk.target_entry.TargetEntry[] targets)
  {
    uint _ntargets;
    if (targets)
      _ntargets = cast(uint)targets.length;

    GtkTargetEntry[] _tmptargets;
    foreach (obj; targets)
      _tmptargets ~= *cast(GtkTargetEntry*)obj._cPtr;
    const(GtkTargetEntry)* _targets = _tmptargets.ptr;

    gtk_target_list_add_table(cast(GtkTargetList*)this._cPtr, _targets, _ntargets);
  }

  /**
      Appends the text targets supported by #GtkSelectionData to
      the target list. All targets are added with the same info.
  
      Params:
        info = an ID that will be passed back to the application
  */
  void addTextTargets(uint info)
  {
    gtk_target_list_add_text_targets(cast(GtkTargetList*)this._cPtr, info);
  }

  /**
      Appends the URI targets supported by #GtkSelectionData to
      the target list. All targets are added with the same info.
      
      Since 3.24.37, this includes the application/vnd.portal.files
      target when possible, to allow sending files between sandboxed
      apps via the FileTransfer portal.
  
      Params:
        info = an ID that will be passed back to the application
  */
  void addUriTargets(uint info)
  {
    gtk_target_list_add_uri_targets(cast(GtkTargetList*)this._cPtr, info);
  }

  /**
      Looks up a given target in a #GtkTargetList.
  
      Params:
        target = an interned atom representing the target to search for
        info = a pointer to the location to store
                 application info for target, or null
      Returns: true if the target was found, otherwise false
  */
  bool find(gdk.atom.Atom target, out uint info)
  {
    bool _retval;
    _retval = cast(bool)gtk_target_list_find(cast(GtkTargetList*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null, cast(uint*)&info);
    return _retval;
  }

  /**
      Removes a target from a target list.
  
      Params:
        target = the interned atom representing the target
  */
  void remove(gdk.atom.Atom target)
  {
    gtk_target_list_remove(cast(GtkTargetList*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null);
  }
}
