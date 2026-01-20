/// Module for [RegionIter] struct
module gtksource.region_iter;

import gid.gid;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/**
    An opaque datatype.
    
    Ignore all its fields and initialize the iter with [gtksource.region.Region.getStartRegionIter].
*/
struct RegionIter
{
  /** */
  void* dummy1;

  /** */
  uint dummy2;

  /** */
  void* dummy3;

  /**
      Gets the subregion at this iterator.
  
      Params:
        start = iterator to initialize with the subregion start, or null.
        end = iterator to initialize with the subregion end, or null.
      Returns: true if start and end have been set successfully (if non-null),
          or false if iter is the end iterator or if the region is empty.
  */
  bool getSubregion(out gtk.text_iter.TextIter start, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_iter_get_subregion(cast(GtkSourceRegionIter*)&this, cast(GtkTextIter*)&start, cast(GtkTextIter*)&end);
    return _retval;
  }

  /** */
  bool isEnd()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_iter_is_end(cast(GtkSourceRegionIter*)&this);
    return _retval;
  }

  /**
      Moves iter to the next subregion.
      Returns: true if iter moved and is dereferenceable, or false if iter has
          been set to the end iterator.
  */
  bool next()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_iter_next(cast(GtkSourceRegionIter*)&this);
    return _retval;
  }
}
