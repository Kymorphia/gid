/// Module for [RegionIter] class
module gid.gtksource5.region_iter;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gtk4.text_iter;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.types;

/**
    An opaque datatype.
    
    Ignore all its fields and initialize the iter with [gid.gtksource5.region.Region.getStartRegionIter].
*/
class RegionIter : StructWrap!(GtkSourceRegionIter)
{
  /**
      Create a `region_iter.RegionIter` wrap type.
  */
  this() nothrow
  {
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    super(ptr, take);
  }

  /** */
  this(void* ptr, Object owner) nothrow
  {
    super(ptr, owner);
  }

  /**
      Gets the subregion at this iterator.
  
      Params:
        start = iterator to initialize with the subregion start, or null.
        end = iterator to initialize with the subregion end, or null.
      Returns: true if start and end have been set successfully (if non-null),
          or false if iter is the end iterator or if the region is empty.
  */
  bool getSubregion(out gid.gtk4.text_iter.TextIter start, out gid.gtk4.text_iter.TextIter end) nothrow
  {
    bool _retval;
    auto _start = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_region_iter_get_subregion(cast(GtkSourceRegionIter*)this._cPtr, _start, _end);
    start = new gid.gtk4.text_iter.TextIter(cast(void*)_start, Yes.Take);
    end = new gid.gtk4.text_iter.TextIter(cast(void*)_end, Yes.Take);
    return _retval;
  }

  /** */
  bool isEnd() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_iter_is_end(cast(GtkSourceRegionIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves iter to the next subregion.
      Returns: true if iter moved and is dereferenceable, or false if iter has
          been set to the end iterator.
  */
  bool next() nothrow
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_iter_next(cast(GtkSourceRegionIter*)this._cPtr);
    return _retval;
  }
}
