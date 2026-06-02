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

  /** */
  this(void* ptr, Flag!"Take" take) nothrow
  {
    _cInstance = *cast(GtkStockItem*)ptr;

    if (take)
      gFree(ptr);
  }

  /** */
  void* _cPtr() nothrow
  {
    return cast(void*)&_cInstance;
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
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).stockId);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)this._cPtr).stockId);
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
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).label);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)this._cPtr).label);
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
    cValueFree!(string)(cast(void*)(cast(GtkStockItem*)this._cPtr).translationDomain);
    dToC(propval, cast(void*)&(cast(GtkStockItem*)this._cPtr).translationDomain);
  }
}
