module gid.basictypes;


// gulong/glong change size depending on if Windows or not
version(Windows)
{
  alias gulong = uint;
  alias glong = int;
}
else
{
  alias gulong = ulong;
  alias glong = long;
}
/** */
class basictypes
{
}
