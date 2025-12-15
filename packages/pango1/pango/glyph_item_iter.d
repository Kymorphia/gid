/// Module for [GlyphItemIter] class
module pango.glyph_item_iter;

import gid.gid;
import gobject.boxed;
import pango.c.functions;
import pango.c.types;
import pango.glyph_item;
import pango.types;

/**
    A [pango.glyph_item_iter.GlyphItemIter] is an iterator over the clusters in a
    [pango.glyph_item.GlyphItem].
    
    The *forward direction* of the iterator is the logical direction of text.
    That is, with increasing @start_index and @start_char values. If @glyph_item
    is right-to-left (that is, if `glyph_item->item->analysis.level` is odd),
    then @start_glyph decreases as the iterator moves forward.  Moreover,
    in right-to-left cases, @start_glyph is greater than @end_glyph.
    
    An iterator should be initialized using either
    [pango.glyph_item_iter.GlyphItemIter.initStart] or
    [pango.glyph_item_iter.GlyphItemIter.initEnd], for forward and backward iteration
    respectively, and walked over using any desired mixture of
    [pango.glyph_item_iter.GlyphItemIter.nextCluster] and
    [pango.glyph_item_iter.GlyphItemIter.prevCluster].
    
    A common idiom for doing a forward iteration over the clusters is:
    
    ```
    PangoGlyphItemIter cluster_iter;
    gboolean have_cluster;
    
    for (have_cluster = pango_glyph_item_iter_init_start (&cluster_iter,
                                                          glyph_item, text);
         have_cluster;
         have_cluster = pango_glyph_item_iter_next_cluster (&cluster_iter))
    {
      ...
    }
    ```
    
    Note that @text is the start of the text for layout, which is then
    indexed by `glyph_item->item->offset` to get to the text of @glyph_item.
    The @start_index and @end_index values can directly index into @text. The
    @start_glyph, @end_glyph, @start_char, and @end_char values however are
    zero-based for the @glyph_item.  For each cluster, the item pointed at by
    the start variables is included in the cluster while the one pointed at by
    end variables is not.
    
    None of the members of a [pango.glyph_item_iter.GlyphItemIter] should be modified manually.
*/
class GlyphItemIter : gobject.boxed.Boxed
{

  /**
      Create a `glyph_item_iter.GlyphItemIter` boxed type.
      Params:
        glyphItem = 
        text = 
        startGlyph = 
        startIndex = 
        startChar = 
        endGlyph = 
        endIndex = 
        endChar = 
  */
  this(pango.glyph_item.GlyphItem glyphItem = pango.glyph_item.GlyphItem.init, string text = string.init, int startGlyph = int.init, int startIndex = int.init, int startChar = int.init, int endGlyph = int.init, int endIndex = int.init, int endChar = int.init)
  {
    super(gMalloc(PangoGlyphItemIter.sizeof), Yes.Take);
    this.glyphItem = glyphItem;
    this.text = text;
    this.startGlyph = startGlyph;
    this.startIndex = startIndex;
    this.startChar = startChar;
    this.endGlyph = endGlyph;
    this.endIndex = endIndex;
    this.endChar = endChar;
  }

  /** */
  this(void* ptr, Flag!"Take" take)
  {
    super(cast(void*)ptr, take);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup)
  {
    return dup ? copy_ : cInstancePtr;
  }

  /** */
  static GType _getGType()
  {
    import gid.loader : gidSymbolNotFound;
    return cast(void function())pango_glyph_item_iter_get_type != &gidSymbolNotFound ? pango_glyph_item_iter_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override GlyphItemIter self()
  {
    return this;
  }

  /** */
  @property pango.glyph_item.GlyphItem glyphItem()
  {
    return cToD!(pango.glyph_item.GlyphItem)(cast(void*)(cast(PangoGlyphItemIter*)this._cPtr).glyphItem);
  }

  /** */
  @property void glyphItem(pango.glyph_item.GlyphItem propval)
  {
    cValueFree!(pango.glyph_item.GlyphItem)(cast(void*)(cast(PangoGlyphItemIter*)this._cPtr).glyphItem);
    dToC(propval, cast(void*)&(cast(PangoGlyphItemIter*)this._cPtr).glyphItem);
  }

  /** */
  @property string text()
  {
    return cToD!(string)(cast(void*)(cast(PangoGlyphItemIter*)this._cPtr).text);
  }

  /** */
  @property void text(string propval)
  {
    cValueFree!(string)(cast(void*)(cast(PangoGlyphItemIter*)this._cPtr).text);
    dToC(propval, cast(void*)&(cast(PangoGlyphItemIter*)this._cPtr).text);
  }

  /** */
  @property int startGlyph()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).startGlyph;
  }

  /** */
  @property void startGlyph(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).startGlyph = propval;
  }

  /** */
  @property int startIndex()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).startIndex;
  }

  /** */
  @property void startIndex(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).startIndex = propval;
  }

  /** */
  @property int startChar()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).startChar;
  }

  /** */
  @property void startChar(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).startChar = propval;
  }

  /** */
  @property int endGlyph()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).endGlyph;
  }

  /** */
  @property void endGlyph(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).endGlyph = propval;
  }

  /** */
  @property int endIndex()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).endIndex;
  }

  /** */
  @property void endIndex(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).endIndex = propval;
  }

  /** */
  @property int endChar()
  {
    return (cast(PangoGlyphItemIter*)this._cPtr).endChar;
  }

  /** */
  @property void endChar(int propval)
  {
    (cast(PangoGlyphItemIter*)this._cPtr).endChar = propval;
  }

  /**
      Make a shallow copy of an existing [pango.glyph_item_iter.GlyphItemIter] structure.
      Returns: the newly allocated [pango.glyph_item_iter.GlyphItemIter]
  */
  pango.glyph_item_iter.GlyphItemIter copy()
  {
    PangoGlyphItemIter* _cretval;
    _cretval = pango_glyph_item_iter_copy(cast(PangoGlyphItemIter*)this._cPtr);
    auto _retval = _cretval ? new pango.glyph_item_iter.GlyphItemIter(cast(void*)_cretval, Yes.Take) : null;
    return _retval;
  }

  /**
      Initializes a [pango.glyph_item_iter.GlyphItemIter] structure to point to the
      last cluster in a glyph item.
      
      See [pango.glyph_item_iter.GlyphItemIter] for details of cluster orders.
  
      Params:
        glyphItem = the glyph item to iterate over
        text = text corresponding to the glyph item
      Returns: false if there are no clusters in the glyph item
  */
  bool initEnd(pango.glyph_item.GlyphItem glyphItem, string text)
  {
    bool _retval;
    const(char)* _text = text.toCString(No.Alloc);
    _retval = cast(bool)pango_glyph_item_iter_init_end(cast(PangoGlyphItemIter*)this._cPtr, glyphItem ? cast(PangoGlyphItem*)glyphItem._cPtr(No.Dup) : null, _text);
    return _retval;
  }

  /**
      Initializes a [pango.glyph_item_iter.GlyphItemIter] structure to point to the
      first cluster in a glyph item.
      
      See [pango.glyph_item_iter.GlyphItemIter] for details of cluster orders.
  
      Params:
        glyphItem = the glyph item to iterate over
        text = text corresponding to the glyph item
      Returns: false if there are no clusters in the glyph item
  */
  bool initStart(pango.glyph_item.GlyphItem glyphItem, string text)
  {
    bool _retval;
    const(char)* _text = text.toCString(No.Alloc);
    _retval = cast(bool)pango_glyph_item_iter_init_start(cast(PangoGlyphItemIter*)this._cPtr, glyphItem ? cast(PangoGlyphItem*)glyphItem._cPtr(No.Dup) : null, _text);
    return _retval;
  }

  /**
      Advances the iterator to the next cluster in the glyph item.
      
      See [pango.glyph_item_iter.GlyphItemIter] for details of cluster orders.
      Returns: true if the iterator was advanced,
          false if we were already on the  last cluster.
  */
  bool nextCluster()
  {
    bool _retval;
    _retval = cast(bool)pango_glyph_item_iter_next_cluster(cast(PangoGlyphItemIter*)this._cPtr);
    return _retval;
  }

  /**
      Moves the iterator to the preceding cluster in the glyph item.
      See [pango.glyph_item_iter.GlyphItemIter] for details of cluster orders.
      Returns: true if the iterator was moved,
          false if we were already on the first cluster.
  */
  bool prevCluster()
  {
    bool _retval;
    _retval = cast(bool)pango_glyph_item_iter_prev_cluster(cast(PangoGlyphItemIter*)this._cPtr);
    return _retval;
  }
}
