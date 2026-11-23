/// Module for [Cache] class
module gid.soup3.cache;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.soup3.c.functions;
import gid.soup3.c.types;
import gid.soup3.message;
import gid.soup3.session_feature;
import gid.soup3.session_feature_mixin;
import gid.soup3.types;

/**
    File-based cache for HTTP resources.
*/
class Cache : gid.gobject2.object.ObjectWrap, gid.soup3.session_feature.SessionFeature
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /**
      Constructor for D subclasses, creates an instance of the GType of the D class (see
      [gid.gobject2.object.GObjectSubclass]).
  */
  protected this() nothrow
  {
    this(_newDSubclassGObject(_dSubclassGType), Yes.Take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())soup_cache_get_type != &gidSymbolNotFound ? soup_cache_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "SoupCache";
  }

  /** Returns `this`, for use in `with` statements. */
  override Cache self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.soup3.cache.Cache]
      Returns: New builder object
  */
  static CacheGidBuilder builder() nothrow
  {
    return new CacheGidBuilder;
  }

  /**
      Get `cacheDir` property.
      Returns: The directory to store the cache files.
  */
  @property string cacheDir() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(string)("cache-dir");
  }

  /**
      Get `cacheType` property.
      Returns: Whether the cache is private or shared.
  */
  @property gid.soup3.types.CacheType cacheType() nothrow
  {
    return gid.gobject2.object.ObjectWrap.getProperty!(gid.soup3.types.CacheType)("cache-type");
  }

  mixin SessionFeatureT!();

  /**
      Creates a new #SoupCache.
  
      Params:
        cacheDir = the directory to store the cached data, or null
            to use the default one. Note that since the cache isn't safe to access for
            multiple processes at once, and the default directory isn't namespaced by
            process, clients are strongly discouraged from passing null.
        cacheType = the #SoupCacheType of the cache
      Returns: a new #SoupCache
  */
  this(string cacheDir, gid.soup3.types.CacheType cacheType) nothrow
  {
    if (_usesDSubclassGType) // D subclass GType (see gid.gobject2.object.GObjectSubclass)
    {
      this(_newDSubclassGObject(_dSubclassGType, true), Yes.Take);
    }
    else
    {
      SoupCache* _cretval;
      const(char)* _cacheDir = cacheDir.toCString!(No.Malloc, Yes.Nullable);
      _cretval = soup_cache_new(_cacheDir, cacheType);
      this(_cretval, Yes.Take);
    }
  }

  /** */
  protected gid.soup3.types.Cacheability vfuncGetCacheability(gid.soup3.message.Message msg)
  {
    auto _klass = cast(SoupCacheClass*)_vfuncClass;
    if (!_klass.getCacheability)
      return typeof(return).init;

    SoupCacheability _cretval;
    _cretval = _klass.getCacheability(cast(SoupCache*)this._cPtr, msg ? cast(SoupMessage*)msg._cPtr(No.Dup) : null);
    gid.soup3.types.Cacheability _retval = cast(gid.soup3.types.Cacheability)_cretval;
    return _retval;
  }

  /**
      Will remove all entries in the cache plus all the cache files.
      
      This is not thread safe and must be called only from the thread that created the [gid.soup3.cache.Cache]
  */
  void clear() nothrow
  {
    soup_cache_clear(cast(SoupCache*)this._cPtr);
  }

  /**
      Synchronously writes the cache index out to disk.
      
      Contrast with [gid.soup3.cache.Cache.flush], which writes pending cache *entries* to
      disk.
      
      You must call this before exiting if you want your cache data to
      persist between sessions.
      
      This is not thread safe and must be called only from the thread that created the [gid.soup3.cache.Cache]
  */
  void dump() nothrow
  {
    soup_cache_dump(cast(SoupCache*)this._cPtr);
  }

  /**
      Forces all pending writes in the cache to be
      committed to disk.
      
      For doing so it will iterate the [gid.glib2.main_context.MainContext] associated with
      cache's session as long as needed.
      
      Contrast with [gid.soup3.cache.Cache.dump], which writes out the cache index file.
  */
  void flush() nothrow
  {
    soup_cache_flush(cast(SoupCache*)this._cPtr);
  }

  /**
      Gets the maximum size of the cache.
      Returns: the maximum size of the cache, in bytes.
  */
  uint getMaxSize() nothrow
  {
    uint _retval;
    _retval = soup_cache_get_max_size(cast(SoupCache*)this._cPtr);
    return _retval;
  }

  /**
      Loads the contents of cache's index into memory.
      
      This is not thread safe and must be called only from the thread that created the [gid.soup3.cache.Cache]
  */
  void load() nothrow
  {
    soup_cache_load(cast(SoupCache*)this._cPtr);
  }

  /**
      Sets the maximum size of the cache.
  
      Params:
        maxSize = the maximum size of the cache, in bytes
  */
  void setMaxSize(uint maxSize) nothrow
  {
    soup_cache_set_max_size(cast(SoupCache*)this._cPtr, maxSize);
  }

  /**
      Install the C virtual method trampolines of the vfunc methods which a D class overrides, in the class structure of
      its GType (DiG, see gid.gobject2.object.GObjectSubclass). Overrides of ancestor class vfunc methods are also
      installed. Overriding a vfunc method which has no trampoline is a compile error.
      Params:
        T = D class derived from Cache
        klass = Class structure of the GType registered for T
  */
  static void _installVfuncs(T)(void* klass) nothrow
  {
    static assert(is(T : gid.soup3.cache.Cache), T.stringof ~ " is not derived from gid.soup3.cache.Cache");

    gid.gobject2.object.ObjectWrap._installVfuncs!T(klass);

    static if (!is(__traits(parent, __traits(getOverloads, T, "vfuncGetCacheability", true)[0]) == gid.soup3.cache.Cache))
      _installVfunc(klass, "get_cacheability");
  }

  private static void _installVfunc(void* klass, string vfunc) nothrow
  {
    auto _klass = cast(SoupCacheClass*)klass;

    switch (vfunc)
    {
      case "get_cacheability":
      {
        static extern(C) SoupCacheability _vfuncGetCacheabilityTramp(SoupCache* cache, SoupMessage* msg) nothrow
        {
          gidAttachThread();
          auto _obj = cast(gid.soup3.cache.Cache)gid.gobject2.object.ObjectWrap._vfuncDObject(cast(void*)cache);
          if (!_obj)
          {
            auto _klass = cast(SoupCacheClass*)gid.gobject2.object.ObjectWrap._vfuncClassOf(cast(void*)cache);
            if (_klass.getCacheability)
              return (cast(typeof(&_vfuncGetCacheabilityTramp))_klass.getCacheability)(cache, msg);
            return typeof(return).init;
          }

          gid.soup3.types.Cacheability _dretval;

          try
          {
            _dretval = _obj.vfuncGetCacheability(gid.gobject2.object.ObjectWrap._getDObject!(gid.soup3.message.Message)(cast(void*)msg, No.Take));
          }
          catch (Exception e)
          {
            gidInvokeCallbackExceptionHandler(e, "gid.soup3.cache.Cache.vfuncGetCacheability");
          }
          auto _retval = cast(SoupCacheability)_dretval;

          return _retval;
        }

        _klass.getCacheability = cast(typeof(_klass.getCacheability))&_vfuncGetCacheabilityTramp;
        break;
      }
      default:
      break;
    }
  }
}

/// Fluent builder implementation template for [gid.soup3.cache.Cache]
class CacheGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T, gid.soup3.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();

  /**
      Set `cacheDir` property.
      Params:
        propval = The directory to store the cache files.
      Returns: Builder instance for fluent chaining
  */
  T cacheDir(string propval) nothrow
  {
    return setProperty("cache-dir", propval);
  }

  /**
      Set `cacheType` property.
      Params:
        propval = Whether the cache is private or shared.
      Returns: Builder instance for fluent chaining
  */
  T cacheType(gid.soup3.types.CacheType propval) nothrow
  {
    return setProperty("cache-type", propval);
  }
}

/// Fluent builder for [gid.soup3.cache.Cache]
final class CacheGidBuilder : CacheGidBuilderImpl!CacheGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Cache build() nothrow
  {
    return new Cache(cast(void*)createGObject(Cache._getGType), Yes.Take);
  }
}
