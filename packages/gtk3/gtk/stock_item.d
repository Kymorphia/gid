/// Module for [StockItem] class
module gtk.stock_item;

public import gid.basictypes;
import gdk.types;
import gid.gid;
import gtk.c.functions;
import gtk.c.types;
import gtk.types;

/** */
class StockItem
{
  GtkStockItem _cInstance;

  /**
      Create a `stock_item.StockItem` wrap type.
      Params:
        stockId = Identifier.
        label = User visible label.
        modifier = Modifier type for keyboard accelerator
        keyval = Keyboard accelerator
        translationDomain = Translation domain of the menu or toolbar item
  */
  this(string stockId = string.init, string label = string.init, gdk.types.ModifierType modifier = gdk.types.ModifierType.init, uint keyval = uint.init, string translationDomain = string.init) nothrow
  {
    this.stockId = stockId;
    this.label = label;
    this.modifier = modifier;
    this.keyval = keyval;
    this.translationDomain = translationDomain;
  }

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkStockItem*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr(Flag!"Dup" dup = No.Dup) nothrow
  {
    return cast(void*)(dup ? mallocDup(&_cInstance) : &_cInstance);
  }

  /**
      Get `stockId` field.
      Returns: Identifier.
  */
  @property string stockId() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).stockId);
  }

  /**
      Set `stockId` field.
      Params:
        propval = Identifier.
  */
  @property void stockId(string propval) nothrow
  {
    (cast(GtkStockItem*)this._cPtr).stockId = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `label` field.
      Returns: User visible label.
  */
  @property string label() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).label);
  }

  /**
      Set `label` field.
      Params:
        propval = User visible label.
  */
  @property void label(string propval) nothrow
  {
    (cast(GtkStockItem*)this._cPtr).label = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }

  /**
      Get `modifier` field.
      Returns: Modifier type for keyboard accelerator
  */
  @property gdk.types.ModifierType modifier() nothrow
  {
    return cast(gdk.types.ModifierType)(cast(GtkStockItem*)this._cPtr).modifier;
  }

  /**
      Set `modifier` field.
      Params:
        propval = Modifier type for keyboard accelerator
  */
  @property void modifier(gdk.types.ModifierType propval) nothrow
  {
    (cast(GtkStockItem*)this._cPtr).modifier = cast(GdkModifierType)propval;
  }

  /**
      Get `keyval` field.
      Returns: Keyboard accelerator
  */
  @property uint keyval() nothrow
  {
    return (cast(GtkStockItem*)this._cPtr).keyval;
  }

  /**
      Set `keyval` field.
      Params:
        propval = Keyboard accelerator
  */
  @property void keyval(uint propval) nothrow
  {
    (cast(GtkStockItem*)this._cPtr).keyval = propval;
  }

  /**
      Get `translationDomain` field.
      Returns: Translation domain of the menu or toolbar item
  */
  @property string translationDomain() nothrow
  {
    return cToD!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).translationDomain);
  }

  /**
      Set `translationDomain` field.
      Params:
        propval = Translation domain of the menu or toolbar item
  */
  @property void translationDomain(string propval) nothrow
  {
    (cast(GtkStockItem*)this._cPtr).translationDomain = cast(char*)toCString!(No.Malloc, Yes.Nullable)(propval);
  }
}
