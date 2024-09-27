include { GET_TOOLS_VERSION } from "../../modules/file_check/get_tools_version"
include { LOG_PARAMS } from "../../modules/log_params"

workflow CHECK_FILE_VALIDITY {

  take:
  ch_versions_log
  modify_versions_log_script
  parameters_file

  main:
  GET_TOOLS_VERSION(ch_versions_log, modify_versions_log_script)

  LOG_PARAMS(parameters_file)

  emit:
  version_txt       = GET_TOOLS_VERSION.out[0]
  params_log       = LOG_PARAMS.out
}
