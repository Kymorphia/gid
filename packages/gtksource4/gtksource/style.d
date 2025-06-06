/// Module for [Style] class
module gtksource.style;

import gid.gid;
import gobject.object;
import gtk.text_tag;
import gtksource.c.functions;
import gtksource.c.types;
import gtksource.types;

/** */
class Style : gobject.object.ObjectWrap
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
    return cast(void function())gtk_source_style_get_type != &gidSymbolNotFound ? gtk_source_style_get_type() : cast(GType)0;
  }

  /** */
  override @property GType _gType()
  {
    return _getGType();
  }

  /** Returns `this`, for use in `with` statements. */
  override Style self()
  {
    return this;
  }

  /**
      This function modifies the #GtkTextTag properties that are related to the
      #GtkSourceStyle properties. Other #GtkTextTag properties are left untouched.
      
      If style is non-null, applies style to tag.
      
      If style is null, the related *-set properties of #GtkTextTag are set to
      false.
  
      Params:
        tag = a #GtkTextTag to apply styles to.
  */
  void apply(gtk.text_tag.TextTag tag)
  {
    gtk_source_style_apply(cast(const(GtkSourceStyle)*)this._cPtr, tag ? cast(GtkTextTag*)tag._cPtr(No.Dup) : null);
  }

  /**
      Creates a copy of style, that is a new #GtkSourceStyle instance which
      has the same attributes set.
      Returns: copy of style, call [gobject.object.ObjectWrap.unref]
        when you are done with it.
  */
  gtksource.style.Style copy()
  {
    GtkSourceStyle* _cretval;
    _cretval = gtk_source_style_copy(cast(const(GtkSourceStyle)*)this._cPtr);
    auto _retval = gobject.object.ObjectWrap._getDObject!(gtksource.style.Style)(cast(GtkSourceStyle*)_cretval, Yes.Take);
    return _retval;
  }
}
