/// Module for [TypeFindFactory] class
module gst.type_find_factory;

import gid.gid;
import gst.c.functions;
import gst.c.types;
import gst.caps;
import gst.plugin_feature;
import gst.type_find;
import gst.types;

/**
    These functions allow querying information about registered typefind
    functions. How to create and register these functions is described in
    the section <link linkend="gstreamer-Writing-typefind-functions">
    "Writing typefind functions"</link>.
    
    The following example shows how to write a very simple typefinder that
    identifies the given data. You can get quite a bit more complicated than
    that though.
    ```c
      typedef struct {
        guint8 *data;
        guint size;
        guint probability;
        GstCaps *data;
      } MyTypeFind;
      static void
      my_peek (gpointer data, gint64 offset, guint size)
      {
        MyTypeFind *find = (MyTypeFind *) data;
        if (offset >= 0 && offset + size <= find->size) {
          return find->data + offset;
        }
        return NULL;
      }
      static void
      my_suggest (gpointer data, guint probability, GstCaps *caps)
      {
        MyTypeFind *find = (MyTypeFind *) data;
        if (probability > find->probability) {
          find->probability = probability;
          gst_caps_replace (&find->caps, caps);
        }
      }
      static GstCaps *
      find_type (guint8 *data, guint size)
      {
        GList *walk, *type_list;
        MyTypeFind find = {data, size, 0, NULL};
        GstTypeFind gst_find = {my_peek, my_suggest, &find, };
        walk = type_list = gst_type_find_factory_get_list ();
        while (walk) {
          GstTypeFindFactory *factory = GST_TYPE_FIND_FACTORY (walk->data);
          walk = g_list_next (walk)
          gst_type_find_factory_call_function (factory, &gst_find);
        }
        g_list_free (type_list);
        return find.caps;
      };
    ```
*/
class TypeFindFactory : gst.plugin_feature.PluginFeature
{

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())gst_type_find_factory_get_type != &gidSymbolNotFound ? gst_type_find_factory_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override TypeFindFactory self()
  {
    return this;
  }

  /**
      Gets the list of all registered typefind factories. You must free the
      list using [gst.plugin_feature.PluginFeature.listFree].
      
      The returned factories are sorted by highest rank first, and then by
      factory name.
      
      Free-function: gst_plugin_feature_list_free
      Returns: the list of all
            registered #GstTypeFindFactory.
  */
  static gst.type_find_factory.TypeFindFactory[] getList()
  {
    GList* _cretval;
    _cretval = gst_type_find_factory_get_list();
    auto _retval = gListToD!(gst.type_find_factory.TypeFindFactory, GidOwnership.Full)(cast(GList*)_cretval);
    return _retval;
  }

  /**
      Calls the #GstTypeFindFunction associated with this factory.
  
      Params:
        find = a properly setup #GstTypeFind entry. The get_data
              and suggest_type members must be set.
  */
  void callFunction(gst.type_find.TypeFind find)
  {
    gst_type_find_factory_call_function(cast(GstTypeFindFactory*)this._cPtr, find ? cast(GstTypeFind*)find._cPtr : null);
  }

  /**
      Gets the #GstCaps associated with a typefind factory.
      Returns: the #GstCaps associated with this factory
  */
  gst.caps.Caps getCaps()
  {
    GstCaps* _cretval;
    _cretval = gst_type_find_factory_get_caps(cast(GstTypeFindFactory*)this._cPtr);
    auto _retval = _cretval ? new gst.caps.Caps(cast(void*)_cretval, No.Take) : null;
    return _retval;
  }

  /**
      Gets the extensions associated with a #GstTypeFindFactory. The returned
      array should not be changed. If you need to change stuff in it, you should
      copy it using [glib.global.strdupv].  This function may return null to indicate
      a 0-length list.
      Returns: a null-terminated array of extensions associated with this factory
  */
  string[] getExtensions()
  {
    const(char*)* _cretval;
    _cretval = gst_type_find_factory_get_extensions(cast(GstTypeFindFactory*)this._cPtr);
    string[] _retval;

    if (_cretval)
    {
      uint _cretlength;
      while (_cretval[_cretlength] !is null)
        _cretlength++;
      _retval = new string[_cretlength];
      foreach (i; 0 .. _cretlength)
        _retval[i] = _cretval[i].fromCString(No.Free);
    }
    return _retval;
  }

  /**
      Check whether the factory has a typefind function. Typefind factories
      without typefind functions are a last-effort fallback mechanism to
      e.g. assume a certain media type based on the file extension.
      Returns: true if the factory has a typefind functions set, otherwise false
  */
  bool hasFunction()
  {
    bool _retval;
    _retval = cast(bool)gst_type_find_factory_has_function(cast(GstTypeFindFactory*)this._cPtr);
    return _retval;
  }
}
