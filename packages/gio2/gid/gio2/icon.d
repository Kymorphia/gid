/// Module for [Icon] interface
module gid.gio2.icon;

public import gid.core.basictypes;
public import gid.gio2.icon_iface_proxy;
import gid.core.utils;
import gid.gio2.c.functions;
import gid.gio2.c.types;
import gid.gio2.types;
import gid.glib2.error;
import gid.glib2.variant;
import gid.gobject2.gid_builder;
import gid.gobject2.object;

/**
    [gid.gio2.icon.Icon] is a very minimal interface for icons. It provides functions
    for checking the equality of two icons, hashing of icons and
    serializing an icon to and from strings.
    
    [gid.gio2.icon.Icon] does not provide the actual pixmap for the icon as this is out
    of GIO's scope, however implementations of [gid.gio2.icon.Icon] may contain the name
    of an icon (see [gid.gio2.themed_icon.ThemedIcon]), or the path to an icon
    (see [gid.gio2.loadable_icon.LoadableIcon]).
    
    To obtain a hash of a [gid.gio2.icon.Icon], see [gid.gio2.icon.Icon.hash].
    
    To check if two [gid.gio2.icon.Icon]s are equal, see [gid.gio2.icon.Icon.equal].
    
    For serializing a [gid.gio2.icon.Icon], use [gid.gio2.icon.Icon.serialize] and
    [gid.gio2.icon.Icon.deserialize].
    
    If you want to consume [gid.gio2.icon.Icon] (for example, in a toolkit) you must
    be prepared to handle at least the three following cases:
    [gid.gio2.loadable_icon.LoadableIcon], [gid.gio2.themed_icon.ThemedIcon] and [gid.gio2.emblemed_icon.EmblemedIcon].
    It may also make sense to have fast-paths for other cases (like handling
    [[gid.gdkpixbuf2.pixbuf.Pixbuf]](https://docs.gtk.org/gdk-pixbuf/class.Pixbuf.html) directly,
    for example) but all compliant [gid.gio2.icon.Icon] implementations outside of GIO must
    implement [gid.gio2.loadable_icon.LoadableIcon].
    
    If your application or library provides one or more [gid.gio2.icon.Icon]
    implementations you need to ensure that your new implementation also
    implements [gid.gio2.loadable_icon.LoadableIcon].  Additionally, you must provide an
    implementation of [gid.gio2.icon.Icon.serialize] that gives a result that is
    understood by [gid.gio2.icon.Icon.deserialize], yielding one of the built-in
    icon types.
*/
interface Icon : GidWrap
{

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())g_icon_get_type != &gidSymbolNotFound ? g_icon_get_type() : cast(GType)0;
  }

  /**
      Deserializes a #GIcon previously serialized using [gid.gio2.icon.Icon.serialize].
  
      Params:
        value = a #GVariant created with [gid.gio2.icon.Icon.serialize]
      Returns: a #GIcon, or null when deserialization fails.
  */
  static gid.gio2.icon.Icon deserialize(gid.glib2.variant.Variant value) nothrow
  {
    GIcon* _cretval;
    _cretval = g_icon_deserialize(value ? cast(GVariant*)value._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Generate a #GIcon instance from str. This function can fail if
      str is not valid - see [gid.gio2.icon.Icon.toString_] for discussion.
      
      If your application or library provides one or more #GIcon
      implementations you need to ensure that each #GType is registered
      with the type system prior to calling [gid.gio2.icon.Icon.newForString].
  
      Params:
        str = A string obtained via [gid.gio2.icon.Icon.toString_].
      Returns: An object implementing the #GIcon
                 interface or null if error is set.
      Throws: [ErrorWrap]
  */
  static gid.gio2.icon.Icon newForString(string str)
  {
    GIcon* _cretval;
    const(char)* _str = str.toCString!(No.Malloc, No.Nullable);
    GError *_err;
    _cretval = g_icon_new_for_string(_str, &_err);
    if (_err)
      throw new ErrorWrap(_err, Yes.Take);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gio2.icon.Icon)(cast(GIcon*)_cretval, Yes.Take);
    return _retval;
  }





  /**
      Checks if two icons are equal.
  
      Params:
        icon2 = pointer to the second #GIcon.
      Returns: true if icon1 is equal to icon2. false otherwise.
  */
  bool equal(gid.gio2.icon.Icon icon2 = null);

  /**
      Gets a hash for an icon.
      Returns: a #guint containing a hash for the icon, suitable for
          use in a #GHashTable or similar data structure.
  */
  uint hash();

  /**
      Serializes a #GIcon into a #GVariant. An equivalent #GIcon can be retrieved
      back by calling [gid.gio2.icon.Icon.deserialize] on the returned value.
      As serialization will avoid using raw icon data when possible, it only
      makes sense to transfer the #GVariant between processes on the same machine,
      (as opposed to over the network), and within the same file system namespace.
      Returns: a #GVariant, or null when serialization fails. The #GVariant will not be floating.
  */
  gid.glib2.variant.Variant serialize();

  /**
      Generates a textual representation of icon that can be used for
      serialization such as when passing icon to a different process or
      saving it to persistent storage. Use [gid.gio2.icon.Icon.newForString] to
      get icon back from the returned string.
      
      The encoding of the returned string is proprietary to #GIcon except
      in the following two cases
      
      - If icon is a #GFileIcon, the returned string is a native path
        (such as `/path/to/my icon.png`) without escaping
        if the #GFile for icon is a native file.  If the file is not
        native, the returned string is the result of [gid.gio2.file.File.getUri]
        (such as `sftp://path/to/my%20icon.png`).
      
      - If icon is a #GThemedIcon with exactly one name and no fallbacks,
        the encoding is simply the name (such as `network-server`).
      Returns: An allocated NUL-terminated UTF8 string or
        null if icon can't be serialized. Use [gid.glib2.global.gfree] to free.
  */
  string toString_();
}

/// Fluent builder implementation template for [gid.gio2.icon.Icon]
interface IconGidBuilderImpl(T)
{
}
