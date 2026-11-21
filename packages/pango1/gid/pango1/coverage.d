/// Module for [Coverage] class
module gid.pango1.coverage;

public import gid.core.basictypes;
import gid.core.gid;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.pango1.c.functions;
import gid.pango1.c.types;
import gid.pango1.types;

/**
    A [gid.pango1.coverage.Coverage] structure is a map from Unicode characters
    to [gid.pango1.types.CoverageLevel] values.
    
    It is often necessary in Pango to determine if a particular
    font can represent a particular character, and also how well
    it can represent that character. The [gid.pango1.coverage.Coverage] is a data
    structure that is used to represent that information. It is an
    opaque structure with no public fields.
*/
class Coverage : gid.gobject2.object.ObjectWrap
{

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  static GType _getGType() nothrow
  {
    import gid.core.loader : gidSymbolNotFound;
    return cast(void function())pango_coverage_get_type != &gidSymbolNotFound ? pango_coverage_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "PangoCoverage";
  }

  /** Returns `this`, for use in `with` statements. */
  override Coverage self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.pango1.coverage.Coverage]
      Returns: New builder object
  */
  static CoverageGidBuilder builder() nothrow
  {
    return new CoverageGidBuilder;
  }

  /**
      Create a new [gid.pango1.coverage.Coverage]
      Returns: the newly allocated [gid.pango1.coverage.Coverage], initialized
          to [gid.pango1.types.CoverageLevel.None] with a reference count of one, which
          should be freed with [gid.pango1.coverage.Coverage.unref].
  */
  this() nothrow
  {
    PangoCoverage* _cretval;
    _cretval = pango_coverage_new();
    this(_cretval, Yes.Take);
  }

  /**
      Convert data generated from [gid.pango1.coverage.Coverage.toBytes]
      back to a [gid.pango1.coverage.Coverage].
  
      Params:
        bytes = binary data
            representing a [gid.pango1.coverage.Coverage]
      Returns: a newly allocated [gid.pango1.coverage.Coverage]
  
      Deprecated: This returns null
  */
  static gid.pango1.coverage.Coverage fromBytes(ubyte[] bytes) nothrow
  {
    PangoCoverage* _cretval;
    int _nBytes;
    if (bytes)
      _nBytes = cast(int)bytes.length;

    auto _bytes = cast(ubyte*)bytes.ptr;
    _cretval = pango_coverage_from_bytes(_bytes, _nBytes);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Copy an existing [gid.pango1.coverage.Coverage].
      Returns: the newly allocated [gid.pango1.coverage.Coverage],
          with a reference count of one, which should be freed with
          [gid.pango1.coverage.Coverage.unref].
  */
  gid.pango1.coverage.Coverage copy() nothrow
  {
    PangoCoverage* _cretval;
    _cretval = pango_coverage_copy(cast(PangoCoverage*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.pango1.coverage.Coverage)(cast(PangoCoverage*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Determine whether a particular index is covered by coverage.
  
      Params:
        index = the index to check
      Returns: the coverage level of coverage for character index_.
  */
  gid.pango1.types.CoverageLevel get(int index) nothrow
  {
    PangoCoverageLevel _cretval;
    _cretval = pango_coverage_get(cast(PangoCoverage*)this._cPtr, index);
    gid.pango1.types.CoverageLevel _retval = cast(gid.pango1.types.CoverageLevel)_cretval;
    return _retval;
  }

  /**
      Set the coverage for each index in coverage to be the max (better)
      value of the current coverage for the index and the coverage for
      the corresponding index in other.
  
      Params:
        other = another [gid.pango1.coverage.Coverage]
  
      Deprecated: This function does nothing
  */
  void max(gid.pango1.coverage.Coverage other) nothrow
  {
    pango_coverage_max(cast(PangoCoverage*)this._cPtr, other ? cast(PangoCoverage*)other._cPtr(No.Dup) : null);
  }

  /**
      Modify a particular index within coverage
  
      Params:
        index = the index to modify
        level = the new level for index_
  */
  void set(int index, gid.pango1.types.CoverageLevel level) nothrow
  {
    pango_coverage_set(cast(PangoCoverage*)this._cPtr, index, level);
  }

  /**
      Convert a [gid.pango1.coverage.Coverage] structure into a flat binary format.
  
      Params:
        bytes = location to store result (must be freed with [gid.glib2.global.gfree])
  
      Deprecated: This returns null
  */
  void toBytes(out ubyte[] bytes) nothrow
  {
    int _nBytes;
    ubyte* _bytes;
    pango_coverage_to_bytes(cast(PangoCoverage*)this._cPtr, &_bytes, &_nBytes);
    bytes.length = _nBytes;
    bytes[0 .. $] = (cast(ubyte*)_bytes)[0 .. _nBytes];
    gFree(cast(void*)_bytes);
  }
}

/// Fluent builder implementation template for [gid.pango1.coverage.Coverage]
class CoverageGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{
}

/// Fluent builder for [gid.pango1.coverage.Coverage]
final class CoverageGidBuilder : CoverageGidBuilderImpl!CoverageGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Coverage build() nothrow
  {
    return new Coverage(cast(void*)createGObject(Coverage._getGType), Yes.Take);
  }
}
