/// Module for [Cache] class
module soup.cache;

import gid.gid;
import gobject.gid_builder;
import gobject.object;
import soup.c.functions;
import soup.c.types;
import soup.session_feature;
import soup.session_feature_mixin;
import soup.types;

/**
    File-based cache for HTTP resources.
*/
class Cache : gobject.object.ObjectWrap, soup.session_feature.SessionFeature
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
    return cast(void function())soup_cache_get_type != &gidSymbolNotFound ? soup_cache_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Cache self()
  {
    return this;
  }

  /**
      Get builder for [soup.cache.Cache]
      Returns: New builder object
  */
  static CacheGidBuilder builder()
  {
    return new CacheGidBuilder;
  }

  /**
      Get `cacheDir` property.
      Returns: The directory to store the cache files.
  */
  @property string cacheDir()
  {
    return gobject.object.ObjectWrap.getProperty!(string)("cache-dir");
  }

  /**
      Get `cacheType` property.
      Returns: Whether the cache is private or shared.
  */
  @property soup.types.CacheType cacheType()
  {
    return gobject.object.ObjectWrap.getProperty!(soup.types.CacheType)("cache-type");
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
  this(string cacheDir, soup.types.CacheType cacheType)
  {
    SoupCache* _cretval;
    const(char)* _cacheDir = cacheDir.toCString(No.Alloc);
    _cretval = soup_cache_new(_cacheDir, cacheType);
    this(_cretval, Yes.Take);
  }

  /**
      Will remove all entries in the cache plus all the cache files.
      
      This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void clear()
  {
    soup_cache_clear(cast(SoupCache*)this._cPtr);
  }

  /**
      Synchronously writes the cache index out to disk.
      
      Contrast with [soup.cache.Cache.flush], which writes pending cache *entries* to
      disk.
      
      You must call this before exiting if you want your cache data to
      persist between sessions.
      
      This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void dump()
  {
    soup_cache_dump(cast(SoupCache*)this._cPtr);
  }

  /**
      Forces all pending writes in the cache to be
      committed to disk.
      
      For doing so it will iterate the [glib.main_context.MainContext] associated with
      cache's session as long as needed.
      
      Contrast with [soup.cache.Cache.dump], which writes out the cache index file.
  */
  void flush()
  {
    soup_cache_flush(cast(SoupCache*)this._cPtr);
  }

  /**
      Gets the maximum size of the cache.
      Returns: the maximum size of the cache, in bytes.
  */
  uint getMaxSize()
  {
    uint _retval;
    _retval = soup_cache_get_max_size(cast(SoupCache*)this._cPtr);
    return _retval;
  }

  /**
      Loads the contents of cache's index into memory.
      
      This is not thread safe and must be called only from the thread that created the #SoupCache
  */
  void load()
  {
    soup_cache_load(cast(SoupCache*)this._cPtr);
  }

  /**
      Sets the maximum size of the cache.
  
      Params:
        maxSize = the maximum size of the cache, in bytes
  */
  void setMaxSize(uint maxSize)
  {
    soup_cache_set_max_size(cast(SoupCache*)this._cPtr, maxSize);
  }
}

/// Fluent builder implementation template for [soup.cache.Cache]
class CacheGidBuilderImpl(T) : gobject.object.ObjectWrapGidBuilderImpl!T, soup.session_feature.SessionFeatureGidBuilderImpl!T
{

  mixin SessionFeatureGidBuilderT!();

  /**
      Set `cacheDir` property.
      Params:
        propval = The directory to store the cache files.
      Returns: Builder instance for fluent chaining
  */
  T cacheDir(string propval)
  {
    return setProperty("cache-dir", propval);
  }

  /**
      Set `cacheType` property.
      Params:
        propval = Whether the cache is private or shared.
      Returns: Builder instance for fluent chaining
  */
  T cacheType(soup.types.CacheType propval)
  {
    return setProperty("cache-type", propval);
  }
}

/// Fluent builder for [soup.cache.Cache]
final class CacheGidBuilder : CacheGidBuilderImpl!CacheGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Cache build()
  {
    return new Cache(cast(void*)createGObject(Cache._getGType), Yes.Take);
  }
}
