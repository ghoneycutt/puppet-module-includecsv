# puppet-module-includecsv

This module contains a function, includecsv(), whose purpose is to
promote system based classification. It does this by taking a single
argument which is a string that contains comma separated classes and
will then include those classes.

To achieve system based classification, use in conjunction with external
facts. You can populate a txt file in facts.d/myclasses.txt with
myclasses='foo,bar,baz' and then use `includecsv($::myclasses)` in your
puppet manifest.

# Usage

```
# include class foo
includecsv('foo')

# include classes foo, bar and baz
includecsv('foo,bar,baz')
```

# Compatibility

This will work on any system.
