#!/usr/bin/env nu

module file_util {
  export def is-file [path] {
    ($path | path expand | path type) == 'file'
  }

  export def is-dir [path] {
    ($path | path expand | path type) == 'dir'
  }

  export def get-files-from-dir [dir: string] {
    (ls $"($dir)/**/*" | find file | get name)
  }

  export def get-files-from-paths [paths] {
    $paths | each {|file|
      if (is-file $file) {
        $file
      } else if (is-dir $file) {
        ((get-files-from-dir $file) | each { |in| echo $in })
      }
    } | flatten
  }
}
