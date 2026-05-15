/// Module for [Icon] interface
module gio.icon;

public import gio.icon_iface_proxy;
import gid.gid;
import gio.c.functions;
import gio.c.types;
import gio.types;
import glib.error;
import glib.variant;
import gobject.gid_builder;
import gobject.object;

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
interface Icon
{

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())g_icon_get_type != &gidSymbolNotFound ? g_icon_get_type() : cast(GType)0;
  }

  /**
      Deserializes a #GIcon previously serialized using [gio.icon.Icon.serialize].
  
      Params:
        value = a #GVariant created with [gio.icon.Icon.serialize]
      Returns: a #GIcon, or null when deserialization fails.
  */
  static gio.icon.Icon deserialize(glib.variant.Variant value)
  {
    GIcon* _cretval;
    _cretval = g_icon_deserialize(value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Generate a #GIcon instance from str. This function can fail if
      str is not valid - see [gio.icon.Icon.toString_] for discussion.
      
      If your application or library provides one or more #GIcon
      implementations you need to ensure that each #GType is registered
      with the type system prior to calling [gio.icon.Icon.newForString].
  
      Params:
        str = A string obtained via [gio.icon.Icon.toString_].
      Returns: An object implementing the #GIcon
                 interface or null if error is set.
      Throws: [ErrorWrap]
  */
  static gio.icon.Icon newForString(string str)
  {
    GIcon* _cretval;
    const(char)* _str = str.toCString(No.Alloc);
    GError *_err;
    _cretval = g_icon_new_for_string(_str, &_err);
    if (_err)
      throw new ErrorWrap(_err);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gio.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Checks if two icons are equal.
  
      Params:
        icon2 = pointer to the second #GIcon.
      Returns: true if icon1 is equal to icon2. false otherwise.
  */
  bool equal(gio.icon.Icon icon2 = null);

  /**
      Gets a hash for an icon.
      Returns: a #guint containing a hash for the icon, suitable for
          use in a #GHashTable or similar data structure.
  */
  uint hash();

  /**
      Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
      back by calling [gio.icon.Icon.deserialize] on the returned value.
      As serialization will avoid using raw icon data when possible, it only
      makes sense to transfer the #GVariant between processes on the same machine,
      (as opposed to over the network), and within the same file system namespace.
      Returns: a #GVariant, or null when serialization fails. The #GVariant will not be floating.
  */
  glib.variant.Variant serialize();

  /**
      Generates a textual representation of icon that can be used for
      serialization such as when passing icon to a different process or
      saving it to persistent storage. Use [gio.icon.Icon.newForString] to
      get icon back from the returned string.
      
      The encoding of the returned string is proprietary to #GIcon except
      in the following two cases
      
      - If icon is a #GFileIcon, the returned string is a native path
        (such as `/path/to/my icon.png`) without escaping
        if the #GFile for icon is a native file.  If the file is not
        native, the returned string is the result of [gio.file.File.getUri]
        (such as `sftp://path/to/my`20icon`.png`).
      
      - If icon is a #GThemedIcon with exactly one name and no fallbacks,
        the encoding is simply the name (such as `network-server`).
      Returns: An allocated NUL-terminated UTF8 string or
        null if icon can't be serialized. Use [glib.global.gfree] to free.
  */
  string toString_();
}

/// Fluent builder implementation template for [gio.icon.Icon]
interface IconGidBuilderImpl(T)
{
}
