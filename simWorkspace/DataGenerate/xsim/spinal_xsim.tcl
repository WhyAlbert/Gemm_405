
proc findFiles { basedir pattern } {

   # Fix the directory name, this ensures the directory name is in the
   # native format for the platform and contains a final directory seperator
   set basedir [string trimright [file join [file normalize $basedir] { }]]
   set fileList {}

   # Look in the current directory for matching files, -type {f r}
   # means ony readable normal files are looked at, -nocomplain stops
   # an error being thrown if the returned list is empty
   foreach fileName [glob -nocomplain -type {f r} -path $basedir $pattern] {
       lappend fileList $fileName
   }

   # Now look for any sub direcories in the current directory
   foreach dirName [glob -nocomplain -type {d  r} -path $basedir *] {
       # Recusively call the routine on the sub directory and append any
       # new files to the results
       set subDirList [findFiles $dirName $pattern]
       if { [llength $subDirList] > 0 } {
           foreach subDirFile $subDirList {
               lappend fileList $subDirFile
           }
       }
   }
   return $fileList
}


create_project -force DataGenerate_xsim -part xcvu9p-fsgd2104-2LV-e
import_files -force D:/Ap_cs/All_Projects/Gemm/Gemm_405/tmp/job_1/DataGenerate.v
import_files -force -quiet [findFiles D:/Ap_cs/All_Projects/Gemm/GemmShift_verilog/GemmShift_verilog.srcs/sources_1/ip/conv11DataCvt *.xci]
import_files -force -quiet [findFiles D:/Ap_cs/All_Projects/Gemm/Gemm_405 *.bd]

update_compile_order -fileset sources_1
set_property top DataGenerate [get_fileset sim_1]



launch_simulation -scripts_only
close_project
