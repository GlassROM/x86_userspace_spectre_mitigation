.section .text
.global __x86_return_thunk
.type __x86_return_thunk, @function
__x86_return_thunk:
    call .spec_end
.spec_start:
    lfence
    jmp .spec_start
.spec_end:
    lea 0x8(%rsp),%rsp
    jmp .end
    int3
.end:
    ret
    int3

.macro INDIRECT_CALL_THUNK cpu_reg
    .section .text
    .global __x86_indirect_thunk_\cpu_reg
    .type __x86_indirect_thunk_\cpu_reg, @function
__x86_indirect_thunk_\cpu_reg:
        jmp .spec_call_\cpu_reg
.spec_safe_\cpu_reg:
        call .safe_call_\cpu_reg
.spec_start_\cpu_reg:
        lfence
        jmp .spec_start_\cpu_reg
.safe_call_\cpu_reg:
        add $0x8, %rsp # Added by .spec_call_\cpu_reg
        mov %\cpu_reg, (%rsp)
        jmp .end_\cpu_reg
        int3
.end_\cpu_reg:
        ret
        int3
.spec_call_\cpu_reg:
        call .spec_safe_\cpu_reg
.endm

.macro INDIRECT_CALL_THUNK_GENERIC name
    .section .text
    .global __x86_indirect_thunk_\name
    .type __x86_indirect_thunk_\name, @function
__x86_indirect_thunk_\name:
        jmp .spec_call_\name
.spec_safe_\name:
        call .safe_call_\name
.spec_start_\name:
        lfence
        jmp .spec_start_\name
.safe_call_\name:
        add $0x8, %rsp # Added by .spec_call_\name
        mov %rax, (%rsp)
        jmp .end_\name
        int3
.end_\name:
        ret
        int3
.spec_call_\name:
        call .spec_safe_\name
.endm

INDIRECT_CALL_THUNK rax
INDIRECT_CALL_THUNK rbx
INDIRECT_CALL_THUNK rcx
INDIRECT_CALL_THUNK rdx
INDIRECT_CALL_THUNK rsi
INDIRECT_CALL_THUNK rdi
INDIRECT_CALL_THUNK rsp
INDIRECT_CALL_THUNK rbp
INDIRECT_CALL_THUNK r8
INDIRECT_CALL_THUNK r9
INDIRECT_CALL_THUNK r10
INDIRECT_CALL_THUNK r11
INDIRECT_CALL_THUNK r12
INDIRECT_CALL_THUNK r13
INDIRECT_CALL_THUNK r14
INDIRECT_CALL_THUNK r15

INDIRECT_CALL_THUNK_GENERIC _array
