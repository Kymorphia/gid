/// Module for [TargetList] class
module gid.gtk3.target_list;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gdk3.atom;
import gid.gobject2.boxed;
import gid.gtk3.c.functions;
import gid.gtk3.c.types;
import gid.gtk3.target_entry;
import gid.gtk3.text_buffer;
import gid.gtk3.types;

/**
    A #GtkTargetList-struct is a reference counted list
    of #GtkTargetPair and should be treated as
    opaque.
*/
class TargetList : gid.gobject2.boxed.BoxedWrap!(gtk_target_list_get_type)
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** Returns `this`, for use in `with` statements. */
  override TargetList self() nothrow
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
  this(gid.gtk3.target_entry.TargetEntry[] targets = null) nothrow
  {
    GtkTargetList* _cretval;
    uint _ntargets;
    if (targets)
      _ntargets = cast(uint)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
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
  void add(gid.gdk3.atom.Atom target, uint flags, uint info) nothrow
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
  void addImageTargets(uint info, bool writable) nothrow
  {
    gtk_target_list_add_image_targets(cast(GtkTargetList*)this._cPtr, info, writable);
  }

  /**
      Appends the rich text targets registered with
      [gid.gtk3.text_buffer.TextBuffer.registerSerializeFormat] or
      [gid.gtk3.text_buffer.TextBuffer.registerDeserializeFormat] to the target list. All
      targets are added with the same info.
  
      Params:
        info = an ID that will be passed back to the application
        deserializable = if true, then deserializable rich text formats
                           will be added, serializable formats otherwise.
        buffer = a #GtkTextBuffer.
  */
  void addRichTextTargets(uint info, bool deserializable, gid.gtk3.text_buffer.TextBuffer buffer) nothrow
  {
    gtk_target_list_add_rich_text_targets(cast(GtkTargetList*)this._cPtr, info, deserializable, buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
  }

  /**
      Prepends a table of #GtkTargetEntry to a target list.
  
      Params:
        targets = the table of #GtkTargetEntry
  */
  void addTable(gid.gtk3.target_entry.TargetEntry[] targets) nothrow
  {
    uint _ntargets;
    if (targets)
      _ntargets = cast(uint)targets.length;

    auto _targets_arr = new GtkTargetEntry[](targets.length);
    auto _targets = _targets_arr.ptr;
    foreach (i, obj; targets) _targets[i] = obj ? *cast(GtkTargetEntry*)obj._cPtr(No.Dup) : GtkTargetEntry.init;
    gtk_target_list_add_table(cast(GtkTargetList*)this._cPtr, _targets, _ntargets);
  }

  /**
      Appends the text targets supported by #GtkSelectionData to
      the target list. All targets are added with the same info.
  
      Params:
        info = an ID that will be passed back to the application
  */
  void addTextTargets(uint info) nothrow
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
  void addUriTargets(uint info) nothrow
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
  bool find(gid.gdk3.atom.Atom target, out uint info) nothrow
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
  void remove(gid.gdk3.atom.Atom target) nothrow
  {
    gtk_target_list_remove(cast(GtkTargetList*)this._cPtr, target ? cast(GdkAtom)target._cPtr : null);
  }
}
