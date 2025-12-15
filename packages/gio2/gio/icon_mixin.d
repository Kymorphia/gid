/// Module for [Icon] interface mixin
module gio.icon_mixin;

public import gio.icon_iface_proxy;
public import gid.gid;
public import gio.c.functions;
public import gio.c.types;
public import gio.types;
public import glib.error;
public import glib.variant;
public import gobject.object;

/**
    [gio.icon.Icon] is a very minimal interface for icons. It provides functions
    for checking the equality of two icons, hashing of icons and
    serializing an icon to and from strings.
    
    [gio.icon.Icon] does not provide the actual pixmap for the icon as this is out
    of GIO's scope, however implementations of [gio.icon.Icon] may contain the name
    of an icon (see [gio.themed_icon.ThemedIcon]), or the path to an icon
    (see [gio.loadable_icon.LoadableIcon]).
    
    To obtain a hash of a [gio.icon.Icon], see [gio.icon.Icon.hash].
    
    To check if two [gio.icon.Icon]s are equal, see [gio.icon.Icon.equal].
    
    For serializing a [gio.icon.Icon], use [gio.icon.Icon.serialize] and
    [gio.icon.Icon.deserialize].
    
    If you want to consume [gio.icon.Icon] (for example, in a toolkit) you must
    be prepared to handle at least the three following cases:
    [gio.loadable_icon.LoadableIcon], [gio.themed_icon.ThemedIcon] and [gio.emblemed_icon.EmblemedIcon].
    It may also make sense to have fast-paths for other cases (like handling
    [[gdkpixbuf.pixbuf.Pixbuf]](https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html) directly,
    for example) but all compliant [gio.icon.Icon] implementations outside of GIO must
    implement [gio.loadable_icon.LoadableIcon].
    
    If your application or library provides one or more [gio.icon.Icon]
    implementations you need to ensure that your new implementation also
    implements [gio.loadable_icon.LoadableIcon].  Additionally, you must provide an
    implementation of [gio.icon.Icon.serialize] that gives a result that is
    understood by [gio.icon.Icon.deserialize], yielding one of the built-in
    icon types.
*/
template IconT()
{



  /**
      Checks if two icons are equal.
  
      Params:
        icon2 = pointer to the second #GIcon.
      Returns: true if icon1 is equal to icon2. false otherwise.
  */
  override bool equal(gio.icon.Icon icon2 = null)
  {
    bool _retval;
    _retval = cast(bool)g_icon_equal(cast(GIcon*)this._cPtr, icon2 ? cast(GIcon*)(cast(gobject.object.ObjectWrap)icon2)._cPtr(No.Dup) : null);
    return _retval;
  }

  /**
      Gets a hash for an icon.
      Returns: a #guint containing a hash for the icon, suitable for
          use in a #GHashTable or similar data structure.
  */
  override uint hash()
  {
    uint _retval;
    _retval = g_icon_hash(cast(GIcon*)this._cPtr);
    return _retval;
  }

  /**
      Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
      back by calling [gio.icon.Icon.deserialize] on the returned value.
      As serialization will avoid using raw icon data when possible, it only
      makes sense to transfer the #GVariant between processes on the same machine,
      (as opposed to over the network), and within the same file system namespace.
      Returns: a #GVariant, or null when serialization fails. The #GVariant will not be floating.
  */
  override glib.variant.Variant serialize()
  {
    GVariant* _cretval;
    _cretval = g_icon_serialize(cast(GIcon*)this._cPtr);
    auto _retval = _cretval ? new glib.variant.Variant(cast(GVariant*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Generates a textual representation of icon that can be used for
      serialization such as when passing icon to a different process or
      saving it to persistent storage. Use [gio.icon.Icon.newForString] to
      get icon back from the returned string.
      
      The encoding of the returned string is proprietary to #GIcon except
      in the following two cases
      
      $(LIST
        * If icon is a #GFileIcon, the returned string is a native path
          (such as `/path/to/my icon.png`) without escaping
          if the #GFile for icon is a native file.  If the file is not
          native, the returned string is the result of [gio.file.File.getUri]
          (such as `sftp://path/to/my`20icon`.png`).
        
        * If icon is a #GThemedIcon with exactly one name and no fallbacks,
          the encoding is simply the name (such as `network-server`).
      )
      Returns: An allocated NUL-terminated UTF8 string or
        null if icon can't be serialized. Use [glib.global.gfree] to free.
  */
  override string toString_()
  {
    char* _cretval;
    _cretval = g_icon_to_string(cast(GIcon*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
