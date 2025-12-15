/// Module for [Region] class
module gtksource.region;

import gid.gid;
import gobject.object;
import gtk.text_buffer;
import gtk.text_iter;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.region_iter;
import gtksource.types;

/**
    Region utility.
    
    A [gtksource.region.Region] permits to store a group of subregions of a
    [gtk.text_buffer.TextBuffer]. [gtksource.region.Region] stores the subregions with pairs of
    [gtk.text_mark.TextMark]'s, so the region is still valid after insertions and deletions
    in the [gtk.text_buffer.TextBuffer].
    
    The [gtk.text_mark.TextMark] for the start of a subregion has a left gravity, while the
    [gtk.text_mark.TextMark] for the end of a subregion has a right gravity.
    
    The typical use-case of [gtksource.region.Region] is to scan a [gtk.text_buffer.TextBuffer] chunk by
    chunk, not the whole buffer at once to not block the user interface. The
    [gtksource.region.Region] represents in that case the remaining region to scan. You
    can listen to the `signal@Gtk.TextBuffer::insert-text` and
    `signal@Gtk.TextBuffer::delete-range` signals to update the [gtksource.region.Region]
    accordingly.
    
    To iterate through the subregions, you need to use a `struct@RegionIter`,
    for example:
    ```c
    GtkSourceRegion *region;
    GtkSourceRegionIter region_iter;
    
    gtk_source_region_get_start_region_iter (region, &region_iter);
    
    while (!gtk_source_region_iter_is_end (&region_iter))
    {
            GtkTextIter subregion_start;
            GtkTextIter subregion_end;
    
            if (!gtk_source_region_iter_get_subregion (&region_iter,
                                                       &subregion_start,
                                                       &subregion_end))
            {
                    break;
            }
    
            // Do something useful with the subregion.
    
            gtk_source_region_iter_next (&region_iter);
    }
    ```
*/
class Region : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_region_get_type != &gidSymbolNotFound ? gtk_source_region_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Region self()
  {
    return this;
  }

  /** */
  this(gtk.text_buffer.TextBuffer buffer)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_new(buffer ? cast(GtkTextBuffer*)buffer._cPtr(No.Dup) : null);
    this(_cretval, Yes.Take);
  }

  /**
      Adds region_to_add to region.
      
      region_to_add is not modified.
  
      Params:
        regionToAdd = the #GtkSourceRegion to add to region, or null.
  */
  void addRegion(gtksource.region.Region regionToAdd = null)
  {
    gtk_source_region_add_region(cast(GtkSourceRegion*)this._cPtr, regionToAdd ? cast(GtkSourceRegion*)regionToAdd._cPtr(No.Dup) : null);
  }

  /**
      Adds the subregion delimited by _start and _end to region.
  
      Params:
        Start = the start of the subregion.
        End = the end of the subregion.
  */
  void addSubregion(gtk.text_iter.TextIter Start, gtk.text_iter.TextIter End)
  {
    gtk_source_region_add_subregion(cast(GtkSourceRegion*)this._cPtr, Start ? cast(const(GtkTextIter)*)Start._cPtr(No.Dup) : null, End ? cast(const(GtkTextIter)*)End._cPtr(No.Dup) : null);
  }

  /**
      Gets the start and end bounds of the region.
  
      Params:
        start = iterator to initialize with the start of region,
            or null.
        end = iterator to initialize with the end of region,
            or null.
      Returns: true if start and end have been set successfully (if non-null),
          or false if the region is empty.
  */
  bool getBounds(out gtk.text_iter.TextIter start, out gtk.text_iter.TextIter end)
  {
    bool _retval;
    GtkTextIter _start;
    GtkTextIter _end;
    _retval = cast(bool)gtk_source_region_get_bounds(cast(GtkSourceRegion*)this._cPtr, &_start, &_end);
    start = new gtk.text_iter.TextIter(cast(void*)&_start, No.Take);
    end = new gtk.text_iter.TextIter(cast(void*)&_end, No.Take);
    return _retval;
  }

  /** */
  gtk.text_buffer.TextBuffer getBuffer()
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_source_region_get_buffer(cast(GtkSourceRegion*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtk.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Initializes a `structRegionIter` to the first subregion of region.
      
      If region is empty, iter will be initialized to the end iterator.
  
      Params:
        iter = iterator to initialize to the first subregion.
  */
  void getStartRegionIter(out gtksource.region_iter.RegionIter iter)
  {
    GtkSourceRegionIter _iter;
    gtk_source_region_get_start_region_iter(cast(GtkSourceRegion*)this._cPtr, &_iter);
    iter = new gtksource.region_iter.RegionIter(cast(void*)&_iter, No.Take);
  }

  /**
      Returns the intersection between region1 and region2.
      
      region1 and region2 are not modified.
  
      Params:
        region2 = a #GtkSourceRegion, or null.
      Returns: the intersection as a #GtkSourceRegion
          object.
  */
  gtksource.region.Region intersectRegion(gtksource.region.Region region2 = null)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_region(cast(GtkSourceRegion*)this._cPtr, region2 ? cast(GtkSourceRegion*)region2._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.region.Region)(cast(GtkSourceRegion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns the intersection between region and the subregion delimited by
      _start and _end.
      
      region is not modified.
  
      Params:
        Start = the start of the subregion.
        End = the end of the subregion.
      Returns: the intersection as a new
          #GtkSourceRegion.
  */
  gtksource.region.Region intersectSubregion(gtk.text_iter.TextIter Start, gtk.text_iter.TextIter End)
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_subregion(cast(GtkSourceRegion*)this._cPtr, Start ? cast(const(GtkTextIter)*)Start._cPtr(No.Dup) : null, End ? cast(const(GtkTextIter)*)End._cPtr(No.Dup) : null);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.region.Region)(cast(GtkSourceRegion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns whether the region is empty.
      
      A null region is considered empty.
      Returns: whether the region is empty.
  */
  bool isEmpty()
  {
    bool _retval;
    _retval = cast(bool)gtk_source_region_is_empty(cast(GtkSourceRegion*)this._cPtr);
    return _retval;
  }

  /**
      Subtracts region_to_subtract from region.
      
      region_to_subtract is not modified.
  
      Params:
        regionToSubtract = the #GtkSourceRegion to subtract from
            region, or null.
  */
  void subtractRegion(gtksource.region.Region regionToSubtract = null)
  {
    gtk_source_region_subtract_region(cast(GtkSourceRegion*)this._cPtr, regionToSubtract ? cast(GtkSourceRegion*)regionToSubtract._cPtr(No.Dup) : null);
  }

  /**
      Subtracts the subregion delimited by _start and _end from region.
  
      Params:
        Start = the start of the subregion.
        End = the end of the subregion.
  */
  void subtractSubregion(gtk.text_iter.TextIter Start, gtk.text_iter.TextIter End)
  {
    gtk_source_region_subtract_subregion(cast(GtkSourceRegion*)this._cPtr, Start ? cast(const(GtkTextIter)*)Start._cPtr(No.Dup) : null, End ? cast(const(GtkTextIter)*)End._cPtr(No.Dup) : null);
  }

  /**
      Gets a string represention of region, for debugging purposes.
      
      The returned string contains the character offsets of the subregions. It
      doesn't include a newline character at the end of the string.
      Returns: a string represention of region. Free
          with [glib.global.gfree] when no longer needed.
  */
  string toString_()
  {
    char* _cretval;
    _cretval = gtk_source_region_to_string(cast(GtkSourceRegion*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString(Yes.Free);
    return _retval;
  }
}
