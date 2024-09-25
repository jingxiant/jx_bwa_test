/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    IMPORT LOCAL MODULES/SUBWORKFLOWS
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

//
// MODULE: Loaded from modules/
//

include {BWA_ALIGN_READS} from "../../subworkflows/align_bwa"

/*
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
    NAMED WORKFLOWS FOR PIPELINE
~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
*/

//
// WORKFLOW: Run main analysis pipeline
//
workflow TARGETED_ANALYSIS {
    
    take:
    reads
    ref_genome
    ref_genome_index
    ch_versions

    main:

    BWA_ALIGN_READS(
        reads,
        ref_genome,
        ref_genome_index
    )
    ch_versions = ch_versions.mix(BWA_ALIGN_READS.out.versions)

    emit:
        BWA_ALIGN_READS.out.aligned_bam
        versions = ch_versions
    

}
