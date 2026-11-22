/// Module for [Region] class
module gid.gtksource5.region;

public import gid.core.basictypes;
import gid.core.utils;
import gid.gobject2.gid_builder;
import gid.gobject2.object;
import gid.gtk4.text_buffer;
import gid.gtk4.text_iter;
import gid.gtksource5.c.functions;
import gid.gtksource5.c.types;
import gid.gtksource5.region_iter;
import gid.gtksource5.types;

/**
    Region utility.
    
    A [gid.gtksource5.region.Region] permits to store a group of subregions of a
    [gid.gtk4.text_buffer.TextBuffer]. [gid.gtksource5.region.Region] stores the subregions with pairs of
    [gid.gtk4.text_mark.TextMark]'s, so the region is still valid after insertions and deletions
    in the [gid.gtk4.text_buffer.TextBuffer].
    
    The [gid.gtk4.text_mark.TextMark] for the start of a subregion has a left gravity, while the
    [gid.gtk4.text_mark.TextMark] for the end of a subregion has a right gravity.
    
    The typical use-case of [gid.gtksource5.region.Region] is to scan a [gid.gtk4.text_buffer.TextBuffer] chunk by
    chunk, not the whole buffer at once to not block the user interface. The
    [gid.gtksource5.region.Region] represents in that case the remaining region to scan. You
    can listen to the [gid.gtk4.text_buffer.TextBuffer.insertText] and
    [gid.gtk4.text_buffer.TextBuffer.deleteRange] signals to update the [gid.gtksource5.region.Region]
    accordingly.
    
    To iterate through the subregions, you need to use a [gid.gtksource5.region_iter.RegionIter],
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
    ```python
    buffer: GtkSource.Buffer = GtkSource.Buffer()
    region: GtkSource.Region = GtkSource.Region(buffer=buffer)
    region_iter = region.get_start_region_iter()
    
    while not region_iter.is_end():
        success, start, end = region_iter.get_subregion()
        if not success:
            break
    
        # Do something useful with the subregion
    
        region_iter.next()
    ```
*/
class Region : gid.gobject2.object.ObjectWrap
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
    return cast(void function())gtk_source_region_get_type != &gidSymbolNotFound ? gtk_source_region_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType() nothrow
  {
    return _getGType();
  }

  /** */
  override @property string _gTypeName() nothrow
  {
    return "GtkSourceRegion";
  }

  /** Returns `this`, for use in `with` statements. */
  override Region self() nothrow
  {
    return this;
  }

  /**
      Get builder for [gid.gtksource5.region.Region]
      Returns: New builder object
  */
  static RegionGidBuilder builder() nothrow
  {
    return new RegionGidBuilder;
  }

  /**
      Get `buffer` property.
      Returns: The [gid.gtk4.text_buffer.TextBuffer]. The #GtkSourceRegion has a weak reference to the
        buffer.
  */
  @property gid.gtk4.text_buffer.TextBuffer buffer() nothrow
  {
    return getBuffer();
  }

  /** */
  this(gid.gtk4.text_buffer.TextBuffer buffer) nothrow
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
  void addRegion(gid.gtksource5.region.Region regionToAdd = null) nothrow
  {
    gtk_source_region_add_region(cast(GtkSourceRegion*)this._cPtr, regionToAdd ? cast(GtkSourceRegion*)regionToAdd._cPtr(No.Dup) : null);
  }

  /**
      Adds the subregion delimited by _start and _end to region.
  
      Params:
        Start = the start of the subregion.
        End = the end of the subregion.
  */
  void addSubregion(gid.gtk4.text_iter.TextIter Start, gid.gtk4.text_iter.TextIter End) nothrow
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
  bool getBounds(out gid.gtk4.text_iter.TextIter start, out gid.gtk4.text_iter.TextIter end) nothrow
  {
    bool _retval;
    auto _start = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    auto _end = boxedNew!GtkTextIter(gid.gtk4.text_iter.TextIter._getGType);
    _retval = cast(bool)gtk_source_region_get_bounds(cast(GtkSourceRegion*)this._cPtr, _start, _end);
    start = new gid.gtk4.text_iter.TextIter(cast(void*)_start, Yes.Take);
    end = new gid.gtk4.text_iter.TextIter(cast(void*)_end, Yes.Take);
    return _retval;
  }

  /** */
  gid.gtk4.text_buffer.TextBuffer getBuffer() nothrow
  {
    GtkTextBuffer* _cretval;
    _cretval = gtk_source_region_get_buffer(cast(GtkSourceRegion*)this._cPtr);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtk4.text_buffer.TextBuffer)(cast(GtkTextBuffer*)_cretval, No.Take);
    return _retval;
  }

  /**
      Initializes a [gid.gtksource5.region_iter.RegionIter] to the first subregion of region.
      
      If region is empty, iter will be initialized to the end iterator.
  
      Params:
        iter = iterator to initialize to the first subregion.
  */
  void getStartRegionIter(out gid.gtksource5.region_iter.RegionIter iter) nothrow
  {
    GtkSourceRegionIter _iter;
    gtk_source_region_get_start_region_iter(cast(GtkSourceRegion*)this._cPtr, &_iter);
    iter = new gid.gtksource5.region_iter.RegionIter(cast(void*)&_iter, No.Take);
    iter._owner = this;
  }

  /**
      Returns the intersection between region1 and region2.
      
      region1 and region2 are not modified.
  
      Params:
        region2 = a #GtkSourceRegion, or null.
      Returns: the intersection as a #GtkSourceRegion
          object.
  */
  gid.gtksource5.region.Region intersectRegion(gid.gtksource5.region.Region region2 = null) nothrow
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_region(cast(GtkSourceRegion*)this._cPtr, region2 ? cast(GtkSourceRegion*)region2._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.region.Region)(cast(GtkSourceRegion*)_cretval, Yes.Take);
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
  gid.gtksource5.region.Region intersectSubregion(gid.gtk4.text_iter.TextIter Start, gid.gtk4.text_iter.TextIter End) nothrow
  {
    GtkSourceRegion* _cretval;
    _cretval = gtk_source_region_intersect_subregion(cast(GtkSourceRegion*)this._cPtr, Start ? cast(const(GtkTextIter)*)Start._cPtr(No.Dup) : null, End ? cast(const(GtkTextIter)*)End._cPtr(No.Dup) : null);
    auto _retval = gid.gobject2.object.ObjectWrap._getDObject!(gid.gtksource5.region.Region)(cast(GtkSourceRegion*)_cretval, Yes.Take);
    return _retval;
  }

  /**
      Returns whether the region is empty.
      
      A null region is considered empty.
      Returns: whether the region is empty.
  */
  bool isEmpty() nothrow
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
  void subtractRegion(gid.gtksource5.region.Region regionToSubtract = null) nothrow
  {
    gtk_source_region_subtract_region(cast(GtkSourceRegion*)this._cPtr, regionToSubtract ? cast(GtkSourceRegion*)regionToSubtract._cPtr(No.Dup) : null);
  }

  /**
      Subtracts the subregion delimited by _start and _end from region.
  
      Params:
        Start = the start of the subregion.
        End = the end of the subregion.
  */
  void subtractSubregion(gid.gtk4.text_iter.TextIter Start, gid.gtk4.text_iter.TextIter End) nothrow
  {
    gtk_source_region_subtract_subregion(cast(GtkSourceRegion*)this._cPtr, Start ? cast(const(GtkTextIter)*)Start._cPtr(No.Dup) : null, End ? cast(const(GtkTextIter)*)End._cPtr(No.Dup) : null);
  }

  /**
      Gets a string represention of region, for debugging purposes.
      
      The returned string contains the character offsets of the subregions. It
      doesn't include a newline character at the end of the string.
      Returns: a string represention of region. Free
          with [gid.glib2.global.gfree] when no longer needed.
  */
  string toString_() nothrow
  {
    char* _cretval;
    _cretval = gtk_source_region_to_string(cast(GtkSourceRegion*)this._cPtr);
    string _retval = (cast(const(char)*)_cretval).fromCString!(Yes.Free);
    return _retval;
  }
}

/// Fluent builder implementation template for [gid.gtksource5.region.Region]
class RegionGidBuilderImpl(T) : gid.gobject2.object.ObjectWrapGidBuilderImpl!T
{

  /**
      Set `buffer` property.
      Params:
        propval = The [gid.gtk4.text_buffer.TextBuffer]. The #GtkSourceRegion has a weak reference to the
          buffer.
      Returns: Builder instance for fluent chaining
  */
  T buffer(gid.gtk4.text_buffer.TextBuffer propval) nothrow
  {
    return setProperty("buffer", propval);
  }
}

/// Fluent builder for [gid.gtksource5.region.Region]
final class RegionGidBuilder : RegionGidBuilderImpl!RegionGidBuilder
{
  /**
      Create object from builder.
      Returns: New object
  */
  Region build() nothrow
  {
    return new Region(cast(void*)createGObject(Region._getGType), Yes.Take);
  }
}
