
./bomb:     file format elf64-x86-64


Disassembly of section .init:

0000000000400b00 <_init>:
  400b00:	48 83 ec 08          	sub    $0x8,%rsp
  400b04:	48 8b 05 ed 34 20 00 	mov    0x2034ed(%rip),%rax        # 603ff8 <_DYNAMIC+0x1d0>
  400b0b:	48 85 c0             	test   %rax,%rax
  400b0e:	74 05                	je     400b15 <_init+0x15>
  400b10:	e8 db 01 00 00       	callq  400cf0 <socket@plt+0x10>
  400b15:	48 83 c4 08          	add    $0x8,%rsp
  400b19:	c3                   	retq   

Disassembly of section .plt:

0000000000400b20 <getenv@plt-0x10>:
  400b20:	ff 35 e2 34 20 00    	pushq  0x2034e2(%rip)        # 604008 <_GLOBAL_OFFSET_TABLE_+0x8>
  400b26:	ff 25 e4 34 20 00    	jmpq   *0x2034e4(%rip)        # 604010 <_GLOBAL_OFFSET_TABLE_+0x10>
  400b2c:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400b30 <getenv@plt>:
  400b30:	ff 25 e2 34 20 00    	jmpq   *0x2034e2(%rip)        # 604018 <_GLOBAL_OFFSET_TABLE_+0x18>
  400b36:	68 00 00 00 00       	pushq  $0x0
  400b3b:	e9 e0 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b40 <strcasecmp@plt>:
  400b40:	ff 25 da 34 20 00    	jmpq   *0x2034da(%rip)        # 604020 <_GLOBAL_OFFSET_TABLE_+0x20>
  400b46:	68 01 00 00 00       	pushq  $0x1
  400b4b:	e9 d0 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b50 <__errno_location@plt>:
  400b50:	ff 25 d2 34 20 00    	jmpq   *0x2034d2(%rip)        # 604028 <_GLOBAL_OFFSET_TABLE_+0x28>
  400b56:	68 02 00 00 00       	pushq  $0x2
  400b5b:	e9 c0 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b60 <strcpy@plt>:
  400b60:	ff 25 ca 34 20 00    	jmpq   *0x2034ca(%rip)        # 604030 <_GLOBAL_OFFSET_TABLE_+0x30>
  400b66:	68 03 00 00 00       	pushq  $0x3
  400b6b:	e9 b0 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b70 <puts@plt>:
  400b70:	ff 25 c2 34 20 00    	jmpq   *0x2034c2(%rip)        # 604038 <_GLOBAL_OFFSET_TABLE_+0x38>
  400b76:	68 04 00 00 00       	pushq  $0x4
  400b7b:	e9 a0 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b80 <write@plt>:
  400b80:	ff 25 ba 34 20 00    	jmpq   *0x2034ba(%rip)        # 604040 <_GLOBAL_OFFSET_TABLE_+0x40>
  400b86:	68 05 00 00 00       	pushq  $0x5
  400b8b:	e9 90 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400b90 <__stack_chk_fail@plt>:
  400b90:	ff 25 b2 34 20 00    	jmpq   *0x2034b2(%rip)        # 604048 <_GLOBAL_OFFSET_TABLE_+0x48>
  400b96:	68 06 00 00 00       	pushq  $0x6
  400b9b:	e9 80 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400ba0 <alarm@plt>:
  400ba0:	ff 25 aa 34 20 00    	jmpq   *0x2034aa(%rip)        # 604050 <_GLOBAL_OFFSET_TABLE_+0x50>
  400ba6:	68 07 00 00 00       	pushq  $0x7
  400bab:	e9 70 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400bb0 <close@plt>:
  400bb0:	ff 25 a2 34 20 00    	jmpq   *0x2034a2(%rip)        # 604058 <_GLOBAL_OFFSET_TABLE_+0x58>
  400bb6:	68 08 00 00 00       	pushq  $0x8
  400bbb:	e9 60 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400bc0 <read@plt>:
  400bc0:	ff 25 9a 34 20 00    	jmpq   *0x20349a(%rip)        # 604060 <_GLOBAL_OFFSET_TABLE_+0x60>
  400bc6:	68 09 00 00 00       	pushq  $0x9
  400bcb:	e9 50 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400bd0 <__libc_start_main@plt>:
  400bd0:	ff 25 92 34 20 00    	jmpq   *0x203492(%rip)        # 604068 <_GLOBAL_OFFSET_TABLE_+0x68>
  400bd6:	68 0a 00 00 00       	pushq  $0xa
  400bdb:	e9 40 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400be0 <fgets@plt>:
  400be0:	ff 25 8a 34 20 00    	jmpq   *0x20348a(%rip)        # 604070 <_GLOBAL_OFFSET_TABLE_+0x70>
  400be6:	68 0b 00 00 00       	pushq  $0xb
  400beb:	e9 30 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400bf0 <signal@plt>:
  400bf0:	ff 25 82 34 20 00    	jmpq   *0x203482(%rip)        # 604078 <_GLOBAL_OFFSET_TABLE_+0x78>
  400bf6:	68 0c 00 00 00       	pushq  $0xc
  400bfb:	e9 20 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c00 <gethostbyname@plt>:
  400c00:	ff 25 7a 34 20 00    	jmpq   *0x20347a(%rip)        # 604080 <_GLOBAL_OFFSET_TABLE_+0x80>
  400c06:	68 0d 00 00 00       	pushq  $0xd
  400c0b:	e9 10 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c10 <__memmove_chk@plt>:
  400c10:	ff 25 72 34 20 00    	jmpq   *0x203472(%rip)        # 604088 <_GLOBAL_OFFSET_TABLE_+0x88>
  400c16:	68 0e 00 00 00       	pushq  $0xe
  400c1b:	e9 00 ff ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c20 <strtol@plt>:
  400c20:	ff 25 6a 34 20 00    	jmpq   *0x20346a(%rip)        # 604090 <_GLOBAL_OFFSET_TABLE_+0x90>
  400c26:	68 0f 00 00 00       	pushq  $0xf
  400c2b:	e9 f0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c30 <fflush@plt>:
  400c30:	ff 25 62 34 20 00    	jmpq   *0x203462(%rip)        # 604098 <_GLOBAL_OFFSET_TABLE_+0x98>
  400c36:	68 10 00 00 00       	pushq  $0x10
  400c3b:	e9 e0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c40 <__isoc99_sscanf@plt>:
  400c40:	ff 25 5a 34 20 00    	jmpq   *0x20345a(%rip)        # 6040a0 <_GLOBAL_OFFSET_TABLE_+0xa0>
  400c46:	68 11 00 00 00       	pushq  $0x11
  400c4b:	e9 d0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c50 <__printf_chk@plt>:
  400c50:	ff 25 52 34 20 00    	jmpq   *0x203452(%rip)        # 6040a8 <_GLOBAL_OFFSET_TABLE_+0xa8>
  400c56:	68 12 00 00 00       	pushq  $0x12
  400c5b:	e9 c0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c60 <fopen@plt>:
  400c60:	ff 25 4a 34 20 00    	jmpq   *0x20344a(%rip)        # 6040b0 <_GLOBAL_OFFSET_TABLE_+0xb0>
  400c66:	68 13 00 00 00       	pushq  $0x13
  400c6b:	e9 b0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c70 <gethostname@plt>:
  400c70:	ff 25 42 34 20 00    	jmpq   *0x203442(%rip)        # 6040b8 <_GLOBAL_OFFSET_TABLE_+0xb8>
  400c76:	68 14 00 00 00       	pushq  $0x14
  400c7b:	e9 a0 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c80 <exit@plt>:
  400c80:	ff 25 3a 34 20 00    	jmpq   *0x20343a(%rip)        # 6040c0 <_GLOBAL_OFFSET_TABLE_+0xc0>
  400c86:	68 15 00 00 00       	pushq  $0x15
  400c8b:	e9 90 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400c90 <connect@plt>:
  400c90:	ff 25 32 34 20 00    	jmpq   *0x203432(%rip)        # 6040c8 <_GLOBAL_OFFSET_TABLE_+0xc8>
  400c96:	68 16 00 00 00       	pushq  $0x16
  400c9b:	e9 80 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400ca0 <__fprintf_chk@plt>:
  400ca0:	ff 25 2a 34 20 00    	jmpq   *0x20342a(%rip)        # 6040d0 <_GLOBAL_OFFSET_TABLE_+0xd0>
  400ca6:	68 17 00 00 00       	pushq  $0x17
  400cab:	e9 70 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400cb0 <sleep@plt>:
  400cb0:	ff 25 22 34 20 00    	jmpq   *0x203422(%rip)        # 6040d8 <_GLOBAL_OFFSET_TABLE_+0xd8>
  400cb6:	68 18 00 00 00       	pushq  $0x18
  400cbb:	e9 60 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400cc0 <__ctype_b_loc@plt>:
  400cc0:	ff 25 1a 34 20 00    	jmpq   *0x20341a(%rip)        # 6040e0 <_GLOBAL_OFFSET_TABLE_+0xe0>
  400cc6:	68 19 00 00 00       	pushq  $0x19
  400ccb:	e9 50 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400cd0 <__sprintf_chk@plt>:
  400cd0:	ff 25 12 34 20 00    	jmpq   *0x203412(%rip)        # 6040e8 <_GLOBAL_OFFSET_TABLE_+0xe8>
  400cd6:	68 1a 00 00 00       	pushq  $0x1a
  400cdb:	e9 40 fe ff ff       	jmpq   400b20 <_init+0x20>

0000000000400ce0 <socket@plt>:
  400ce0:	ff 25 0a 34 20 00    	jmpq   *0x20340a(%rip)        # 6040f0 <_GLOBAL_OFFSET_TABLE_+0xf0>
  400ce6:	68 1b 00 00 00       	pushq  $0x1b
  400ceb:	e9 30 fe ff ff       	jmpq   400b20 <_init+0x20>

Disassembly of section .plt.got:

0000000000400cf0 <.plt.got>:
  400cf0:	ff 25 02 33 20 00    	jmpq   *0x203302(%rip)        # 603ff8 <_DYNAMIC+0x1d0>
  400cf6:	66 90                	xchg   %ax,%ax

Disassembly of section .text:

0000000000400d00 <_start>:
  400d00:	31 ed                	xor    %ebp,%ebp
  400d02:	49 89 d1             	mov    %rdx,%r9
  400d05:	5e                   	pop    %rsi
  400d06:	48 89 e2             	mov    %rsp,%rdx
  400d09:	48 83 e4 f0          	and    $0xfffffffffffffff0,%rsp
  400d0d:	50                   	push   %rax
  400d0e:	54                   	push   %rsp
  400d0f:	49 c7 c0 60 25 40 00 	mov    $0x402560,%r8
  400d16:	48 c7 c1 f0 24 40 00 	mov    $0x4024f0,%rcx
  400d1d:	48 c7 c7 f6 0d 40 00 	mov    $0x400df6,%rdi
  400d24:	e8 a7 fe ff ff       	callq  400bd0 <__libc_start_main@plt>
  400d29:	f4                   	hlt    
  400d2a:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400d30 <deregister_tm_clones>:
  400d30:	b8 87 47 60 00       	mov    $0x604787,%eax
  400d35:	55                   	push   %rbp
  400d36:	48 2d 80 47 60 00    	sub    $0x604780,%rax
  400d3c:	48 83 f8 0e          	cmp    $0xe,%rax
  400d40:	48 89 e5             	mov    %rsp,%rbp
  400d43:	76 1b                	jbe    400d60 <deregister_tm_clones+0x30>
  400d45:	b8 00 00 00 00       	mov    $0x0,%eax
  400d4a:	48 85 c0             	test   %rax,%rax
  400d4d:	74 11                	je     400d60 <deregister_tm_clones+0x30>
  400d4f:	5d                   	pop    %rbp
  400d50:	bf 80 47 60 00       	mov    $0x604780,%edi
  400d55:	ff e0                	jmpq   *%rax
  400d57:	66 0f 1f 84 00 00 00 	nopw   0x0(%rax,%rax,1)
  400d5e:	00 00 
  400d60:	5d                   	pop    %rbp
  400d61:	c3                   	retq   
  400d62:	0f 1f 40 00          	nopl   0x0(%rax)
  400d66:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  400d6d:	00 00 00 

0000000000400d70 <register_tm_clones>:
  400d70:	be 80 47 60 00       	mov    $0x604780,%esi
  400d75:	55                   	push   %rbp
  400d76:	48 81 ee 80 47 60 00 	sub    $0x604780,%rsi
  400d7d:	48 c1 fe 03          	sar    $0x3,%rsi
  400d81:	48 89 e5             	mov    %rsp,%rbp
  400d84:	48 89 f0             	mov    %rsi,%rax
  400d87:	48 c1 e8 3f          	shr    $0x3f,%rax
  400d8b:	48 01 c6             	add    %rax,%rsi
  400d8e:	48 d1 fe             	sar    %rsi
  400d91:	74 15                	je     400da8 <register_tm_clones+0x38>
  400d93:	b8 00 00 00 00       	mov    $0x0,%eax
  400d98:	48 85 c0             	test   %rax,%rax
  400d9b:	74 0b                	je     400da8 <register_tm_clones+0x38>
  400d9d:	5d                   	pop    %rbp
  400d9e:	bf 80 47 60 00       	mov    $0x604780,%edi
  400da3:	ff e0                	jmpq   *%rax
  400da5:	0f 1f 00             	nopl   (%rax)
  400da8:	5d                   	pop    %rbp
  400da9:	c3                   	retq   
  400daa:	66 0f 1f 44 00 00    	nopw   0x0(%rax,%rax,1)

0000000000400db0 <__do_global_dtors_aux>:
  400db0:	80 3d f1 39 20 00 00 	cmpb   $0x0,0x2039f1(%rip)        # 6047a8 <completed.7585>
  400db7:	75 11                	jne    400dca <__do_global_dtors_aux+0x1a>
  400db9:	55                   	push   %rbp
  400dba:	48 89 e5             	mov    %rsp,%rbp
  400dbd:	e8 6e ff ff ff       	callq  400d30 <deregister_tm_clones>
  400dc2:	5d                   	pop    %rbp
  400dc3:	c6 05 de 39 20 00 01 	movb   $0x1,0x2039de(%rip)        # 6047a8 <completed.7585>
  400dca:	f3 c3                	repz retq 
  400dcc:	0f 1f 40 00          	nopl   0x0(%rax)

0000000000400dd0 <frame_dummy>:
  400dd0:	bf 20 3e 60 00       	mov    $0x603e20,%edi
  400dd5:	48 83 3f 00          	cmpq   $0x0,(%rdi)
  400dd9:	75 05                	jne    400de0 <frame_dummy+0x10>
  400ddb:	eb 93                	jmp    400d70 <register_tm_clones>
  400ddd:	0f 1f 00             	nopl   (%rax)
  400de0:	b8 00 00 00 00       	mov    $0x0,%eax
  400de5:	48 85 c0             	test   %rax,%rax
  400de8:	74 f1                	je     400ddb <frame_dummy+0xb>
  400dea:	55                   	push   %rbp
  400deb:	48 89 e5             	mov    %rsp,%rbp
  400dee:	ff d0                	callq  *%rax
  400df0:	5d                   	pop    %rbp
  400df1:	e9 7a ff ff ff       	jmpq   400d70 <register_tm_clones>

0000000000400df6 <main>:
  400df6:	53                   	push   %rbx
  400df7:	83 ff 01             	cmp    $0x1,%edi
  400dfa:	75 10                	jne    400e0c <main+0x16>
  400dfc:	48 8b 05 8d 39 20 00 	mov    0x20398d(%rip),%rax        # 604790 <stdin@@GLIBC_2.2.5>
  400e03:	48 89 05 a6 39 20 00 	mov    %rax,0x2039a6(%rip)        # 6047b0 <infile>
  400e0a:	eb 63                	jmp    400e6f <main+0x79>
  400e0c:	48 89 f3             	mov    %rsi,%rbx
  400e0f:	83 ff 02             	cmp    $0x2,%edi
  400e12:	75 3a                	jne    400e4e <main+0x58>
  400e14:	48 8b 7e 08          	mov    0x8(%rsi),%rdi
  400e18:	be 84 25 40 00       	mov    $0x402584,%esi
  400e1d:	e8 3e fe ff ff       	callq  400c60 <fopen@plt>
  400e22:	48 89 05 87 39 20 00 	mov    %rax,0x203987(%rip)        # 6047b0 <infile>
  400e29:	48 85 c0             	test   %rax,%rax
  400e2c:	75 41                	jne    400e6f <main+0x79>
  400e2e:	48 8b 4b 08          	mov    0x8(%rbx),%rcx
  400e32:	48 8b 13             	mov    (%rbx),%rdx
  400e35:	be 86 25 40 00       	mov    $0x402586,%esi
  400e3a:	bf 01 00 00 00       	mov    $0x1,%edi
  400e3f:	e8 0c fe ff ff       	callq  400c50 <__printf_chk@plt>
  400e44:	bf 08 00 00 00       	mov    $0x8,%edi
  400e49:	e8 32 fe ff ff       	callq  400c80 <exit@plt>
  400e4e:	48 8b 16             	mov    (%rsi),%rdx
  400e51:	be a3 25 40 00       	mov    $0x4025a3,%esi
  400e56:	bf 01 00 00 00       	mov    $0x1,%edi
  400e5b:	b8 00 00 00 00       	mov    $0x0,%eax
  400e60:	e8 eb fd ff ff       	callq  400c50 <__printf_chk@plt>
  400e65:	bf 08 00 00 00       	mov    $0x8,%edi
  400e6a:	e8 11 fe ff ff       	callq  400c80 <exit@plt>
  400e6f:	e8 31 06 00 00       	callq  4014a5 <initialize_bomb>
  400e74:	bf 08 26 40 00       	mov    $0x402608,%edi
  400e79:	e8 f2 fc ff ff       	callq  400b70 <puts@plt>
  400e7e:	bf 48 26 40 00       	mov    $0x402648,%edi
  400e83:	e8 e8 fc ff ff       	callq  400b70 <puts@plt>
  400e88:	e8 fa 08 00 00       	callq  401787 <read_line>
  400e8d:	48 89 c7             	mov    %rax,%rdi
  400e90:	e8 98 00 00 00       	callq  400f2d <phase_1>
  400e95:	e8 13 0a 00 00       	callq  4018ad <phase_defused>
  400e9a:	bf 78 26 40 00       	mov    $0x402678,%edi
  400e9f:	e8 cc fc ff ff       	callq  400b70 <puts@plt>
  400ea4:	e8 de 08 00 00       	callq  401787 <read_line>
  400ea9:	48 89 c7             	mov    %rax,%rdi
  400eac:	e8 98 00 00 00       	callq  400f49 <phase_2>
  400eb1:	e8 f7 09 00 00       	callq  4018ad <phase_defused>
  400eb6:	bf bd 25 40 00       	mov    $0x4025bd,%edi
  400ebb:	e8 b0 fc ff ff       	callq  400b70 <puts@plt>
  400ec0:	e8 c2 08 00 00       	callq  401787 <read_line>
  400ec5:	48 89 c7             	mov    %rax,%rdi
  400ec8:	e8 e0 00 00 00       	callq  400fad <phase_3>
  400ecd:	e8 db 09 00 00       	callq  4018ad <phase_defused>
  400ed2:	bf db 25 40 00       	mov    $0x4025db,%edi
  400ed7:	e8 94 fc ff ff       	callq  400b70 <puts@plt>
  400edc:	e8 a6 08 00 00       	callq  401787 <read_line>
  400ee1:	48 89 c7             	mov    %rax,%rdi
  400ee4:	e8 6f 02 00 00       	callq  401158 <phase_4>
  400ee9:	e8 bf 09 00 00       	callq  4018ad <phase_defused>
  400eee:	bf a8 26 40 00       	mov    $0x4026a8,%edi
  400ef3:	e8 78 fc ff ff       	callq  400b70 <puts@plt>
  400ef8:	e8 8a 08 00 00       	callq  401787 <read_line>
  400efd:	48 89 c7             	mov    %rax,%rdi
  400f00:	e8 c6 02 00 00       	callq  4011cb <phase_5>
  400f05:	e8 a3 09 00 00       	callq  4018ad <phase_defused>
  400f0a:	bf ea 25 40 00       	mov    $0x4025ea,%edi
  400f0f:	e8 5c fc ff ff       	callq  400b70 <puts@plt>
  400f14:	e8 6e 08 00 00       	callq  401787 <read_line>
  400f19:	48 89 c7             	mov    %rax,%rdi
  400f1c:	e8 eb 02 00 00       	callq  40120c <phase_6>
  400f21:	e8 87 09 00 00       	callq  4018ad <phase_defused>
  400f26:	b8 00 00 00 00       	mov    $0x0,%eax
  400f2b:	5b                   	pop    %rbx
  400f2c:	c3                   	retq   

0000000000400f2d <phase_1>:
  400f2d:	48 83 ec 08          	sub    $0x8,%rsp
  400f31:	be d0 26 40 00       	mov    $0x4026d0,%esi
  400f36:	e8 03 05 00 00       	callq  40143e <strings_not_equal>
  400f3b:	85 c0                	test   %eax,%eax
  400f3d:	74 05                	je     400f44 <phase_1+0x17>
  400f3f:	e8 ce 07 00 00       	callq  401712 <explode_bomb>
  400f44:	48 83 c4 08          	add    $0x8,%rsp
  400f48:	c3                   	retq   

0000000000400f49 <phase_2>:
  400f49:	55                   	push   %rbp
  400f4a:	53                   	push   %rbx
  400f4b:	48 83 ec 28          	sub    $0x28,%rsp
  400f4f:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400f56:	00 00 
  400f58:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  400f5d:	31 c0                	xor    %eax,%eax
  400f5f:	48 89 e6             	mov    %rsp,%rsi
  400f62:	e8 e1 07 00 00       	callq  401748 <read_six_numbers>
  400f67:	83 3c 24 01          	cmpl   $0x1,(%rsp)
  400f6b:	74 05                	je     400f72 <phase_2+0x29>
  400f6d:	e8 a0 07 00 00       	callq  401712 <explode_bomb>
  400f72:	48 89 e3             	mov    %rsp,%rbx
  400f75:	48 8d 6c 24 14       	lea    0x14(%rsp),%rbp
  400f7a:	8b 03                	mov    (%rbx),%eax
  400f7c:	01 c0                	add    %eax,%eax
  400f7e:	39 43 04             	cmp    %eax,0x4(%rbx)
  400f81:	74 05                	je     400f88 <phase_2+0x3f>
  400f83:	e8 8a 07 00 00       	callq  401712 <explode_bomb>
  400f88:	48 83 c3 04          	add    $0x4,%rbx
  400f8c:	48 39 eb             	cmp    %rbp,%rbx
  400f8f:	75 e9                	jne    400f7a <phase_2+0x31>
  400f91:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  400f96:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  400f9d:	00 00 
  400f9f:	74 05                	je     400fa6 <phase_2+0x5d>
  400fa1:	e8 ea fb ff ff       	callq  400b90 <__stack_chk_fail@plt>
  400fa6:	48 83 c4 28          	add    $0x28,%rsp
  400faa:	5b                   	pop    %rbx
  400fab:	5d                   	pop    %rbp
  400fac:	c3                   	retq   

0000000000400fad <phase_3>:
  400fad:	48 83 ec 28          	sub    $0x28,%rsp
  400fb1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  400fb8:	00 00 
  400fba:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  400fbf:	31 c0                	xor    %eax,%eax
  400fc1:	4c 8d 44 24 14       	lea    0x14(%rsp),%r8
  400fc6:	48 8d 4c 24 0f       	lea    0xf(%rsp),%rcx
  400fcb:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  400fd0:	be 1e 27 40 00       	mov    $0x40271e,%esi
  400fd5:	e8 66 fc ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  400fda:	83 f8 02             	cmp    $0x2,%eax
  400fdd:	7f 05                	jg     400fe4 <phase_3+0x37>
  400fdf:	e8 2e 07 00 00       	callq  401712 <explode_bomb>
  400fe4:	83 7c 24 10 07       	cmpl   $0x7,0x10(%rsp)
  400fe9:	0f 87 fc 00 00 00    	ja     4010eb <phase_3+0x13e>
  400fef:	8b 44 24 10          	mov    0x10(%rsp),%eax
  400ff3:	ff 24 c5 40 27 40 00 	jmpq   *0x402740(,%rax,8)
  400ffa:	b8 6e 00 00 00       	mov    $0x6e,%eax
  400fff:	81 7c 24 14 4c 03 00 	cmpl   $0x34c,0x14(%rsp)
  401006:	00 
  401007:	0f 84 e8 00 00 00    	je     4010f5 <phase_3+0x148>
  40100d:	e8 00 07 00 00       	callq  401712 <explode_bomb>
  401012:	b8 6e 00 00 00       	mov    $0x6e,%eax
  401017:	e9 d9 00 00 00       	jmpq   4010f5 <phase_3+0x148>
  40101c:	b8 68 00 00 00       	mov    $0x68,%eax
  401021:	81 7c 24 14 18 01 00 	cmpl   $0x118,0x14(%rsp)
  401028:	00 
  401029:	0f 84 c6 00 00 00    	je     4010f5 <phase_3+0x148>
  40102f:	e8 de 06 00 00       	callq  401712 <explode_bomb>
  401034:	b8 68 00 00 00       	mov    $0x68,%eax
  401039:	e9 b7 00 00 00       	jmpq   4010f5 <phase_3+0x148>
  40103e:	b8 66 00 00 00       	mov    $0x66,%eax
  401043:	81 7c 24 14 c2 00 00 	cmpl   $0xc2,0x14(%rsp)
  40104a:	00 
  40104b:	0f 84 a4 00 00 00    	je     4010f5 <phase_3+0x148>
  401051:	e8 bc 06 00 00       	callq  401712 <explode_bomb>
  401056:	b8 66 00 00 00       	mov    $0x66,%eax
  40105b:	e9 95 00 00 00       	jmpq   4010f5 <phase_3+0x148>
  401060:	b8 66 00 00 00       	mov    $0x66,%eax
  401065:	81 7c 24 14 9f 01 00 	cmpl   $0x19f,0x14(%rsp)
  40106c:	00 
  40106d:	0f 84 82 00 00 00    	je     4010f5 <phase_3+0x148>
  401073:	e8 9a 06 00 00       	callq  401712 <explode_bomb>
  401078:	b8 66 00 00 00       	mov    $0x66,%eax
  40107d:	eb 76                	jmp    4010f5 <phase_3+0x148>
  40107f:	b8 75 00 00 00       	mov    $0x75,%eax
  401084:	81 7c 24 14 32 03 00 	cmpl   $0x332,0x14(%rsp)
  40108b:	00 
  40108c:	74 67                	je     4010f5 <phase_3+0x148>
  40108e:	e8 7f 06 00 00       	callq  401712 <explode_bomb>
  401093:	b8 75 00 00 00       	mov    $0x75,%eax
  401098:	eb 5b                	jmp    4010f5 <phase_3+0x148>
  40109a:	b8 66 00 00 00       	mov    $0x66,%eax
  40109f:	81 7c 24 14 29 02 00 	cmpl   $0x229,0x14(%rsp)
  4010a6:	00 
  4010a7:	74 4c                	je     4010f5 <phase_3+0x148>
  4010a9:	e8 64 06 00 00       	callq  401712 <explode_bomb>
  4010ae:	b8 66 00 00 00       	mov    $0x66,%eax
  4010b3:	eb 40                	jmp    4010f5 <phase_3+0x148>
  4010b5:	b8 72 00 00 00       	mov    $0x72,%eax
  4010ba:	81 7c 24 14 87 01 00 	cmpl   $0x187,0x14(%rsp)
  4010c1:	00 
  4010c2:	74 31                	je     4010f5 <phase_3+0x148>
  4010c4:	e8 49 06 00 00       	callq  401712 <explode_bomb>
  4010c9:	b8 72 00 00 00       	mov    $0x72,%eax
  4010ce:	eb 25                	jmp    4010f5 <phase_3+0x148>
  4010d0:	b8 65 00 00 00       	mov    $0x65,%eax
  4010d5:	81 7c 24 14 7a 02 00 	cmpl   $0x27a,0x14(%rsp)
  4010dc:	00 
  4010dd:	74 16                	je     4010f5 <phase_3+0x148>
  4010df:	e8 2e 06 00 00       	callq  401712 <explode_bomb>
  4010e4:	b8 65 00 00 00       	mov    $0x65,%eax
  4010e9:	eb 0a                	jmp    4010f5 <phase_3+0x148>
  4010eb:	e8 22 06 00 00       	callq  401712 <explode_bomb>
  4010f0:	b8 6e 00 00 00       	mov    $0x6e,%eax
  4010f5:	3a 44 24 0f          	cmp    0xf(%rsp),%al
  4010f9:	74 05                	je     401100 <phase_3+0x153>
  4010fb:	e8 12 06 00 00       	callq  401712 <explode_bomb>
  401100:	48 8b 44 24 18       	mov    0x18(%rsp),%rax
  401105:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40110c:	00 00 
  40110e:	74 05                	je     401115 <phase_3+0x168>
  401110:	e8 7b fa ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401115:	48 83 c4 28          	add    $0x28,%rsp
  401119:	c3                   	retq   

000000000040111a <func4>:
  40111a:	48 83 ec 08          	sub    $0x8,%rsp
  40111e:	89 d0                	mov    %edx,%eax
  401120:	29 f0                	sub    %esi,%eax
  401122:	89 c1                	mov    %eax,%ecx
  401124:	c1 e9 1f             	shr    $0x1f,%ecx
  401127:	01 c8                	add    %ecx,%eax
  401129:	d1 f8                	sar    %eax
  40112b:	8d 0c 30             	lea    (%rax,%rsi,1),%ecx
  40112e:	39 f9                	cmp    %edi,%ecx
  401130:	7e 0c                	jle    40113e <func4+0x24>
  401132:	8d 51 ff             	lea    -0x1(%rcx),%edx
  401135:	e8 e0 ff ff ff       	callq  40111a <func4>
  40113a:	01 c0                	add    %eax,%eax
  40113c:	eb 15                	jmp    401153 <func4+0x39>
  40113e:	b8 00 00 00 00       	mov    $0x0,%eax
  401143:	39 f9                	cmp    %edi,%ecx
  401145:	7d 0c                	jge    401153 <func4+0x39>
  401147:	8d 71 01             	lea    0x1(%rcx),%esi
  40114a:	e8 cb ff ff ff       	callq  40111a <func4>
  40114f:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401153:	48 83 c4 08          	add    $0x8,%rsp
  401157:	c3                   	retq   

0000000000401158 <phase_4>:
  401158:	48 83 ec 18          	sub    $0x18,%rsp
  40115c:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401163:	00 00 
  401165:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  40116a:	31 c0                	xor    %eax,%eax
  40116c:	48 8d 4c 24 04       	lea    0x4(%rsp),%rcx
  401171:	48 89 e2             	mov    %rsp,%rdx
  401174:	be 0d 2a 40 00       	mov    $0x402a0d,%esi
  401179:	e8 c2 fa ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  40117e:	83 f8 02             	cmp    $0x2,%eax
  401181:	75 06                	jne    401189 <phase_4+0x31>
  401183:	83 3c 24 0e          	cmpl   $0xe,(%rsp)
  401187:	76 05                	jbe    40118e <phase_4+0x36>
  401189:	e8 84 05 00 00       	callq  401712 <explode_bomb>
  40118e:	ba 0e 00 00 00       	mov    $0xe,%edx
  401193:	be 00 00 00 00       	mov    $0x0,%esi
  401198:	8b 3c 24             	mov    (%rsp),%edi
  40119b:	e8 7a ff ff ff       	callq  40111a <func4>
  4011a0:	83 f8 01             	cmp    $0x1,%eax
  4011a3:	75 07                	jne    4011ac <phase_4+0x54>
  4011a5:	83 7c 24 04 01       	cmpl   $0x1,0x4(%rsp)
  4011aa:	74 05                	je     4011b1 <phase_4+0x59>
  4011ac:	e8 61 05 00 00       	callq  401712 <explode_bomb>
  4011b1:	48 8b 44 24 08       	mov    0x8(%rsp),%rax
  4011b6:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  4011bd:	00 00 
  4011bf:	74 05                	je     4011c6 <phase_4+0x6e>
  4011c1:	e8 ca f9 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  4011c6:	48 83 c4 18          	add    $0x18,%rsp
  4011ca:	c3                   	retq   

00000000004011cb <phase_5>:
  4011cb:	53                   	push   %rbx
  4011cc:	48 89 fb             	mov    %rdi,%rbx
  4011cf:	e8 4c 02 00 00       	callq  401420 <string_length>
  4011d4:	83 f8 06             	cmp    $0x6,%eax
  4011d7:	74 05                	je     4011de <phase_5+0x13>
  4011d9:	e8 34 05 00 00       	callq  401712 <explode_bomb>
  4011de:	48 89 d8             	mov    %rbx,%rax
  4011e1:	48 8d 7b 06          	lea    0x6(%rbx),%rdi
  4011e5:	b9 00 00 00 00       	mov    $0x0,%ecx
  4011ea:	0f b6 10             	movzbl (%rax),%edx
  4011ed:	83 e2 0f             	and    $0xf,%edx
  4011f0:	03 0c 95 80 27 40 00 	add    0x402780(,%rdx,4),%ecx
  4011f7:	48 83 c0 01          	add    $0x1,%rax
  4011fb:	48 39 f8             	cmp    %rdi,%rax
  4011fe:	75 ea                	jne    4011ea <phase_5+0x1f>
  401200:	83 f9 30             	cmp    $0x30,%ecx
  401203:	74 05                	je     40120a <phase_5+0x3f>
  401205:	e8 08 05 00 00       	callq  401712 <explode_bomb>
  40120a:	5b                   	pop    %rbx
  40120b:	c3                   	retq   

000000000040120c <phase_6>:
  40120c:	41 55                	push   %r13
  40120e:	41 54                	push   %r12
  401210:	55                   	push   %rbp
  401211:	53                   	push   %rbx
  401212:	48 83 ec 68          	sub    $0x68,%rsp
  401216:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  40121d:	00 00 
  40121f:	48 89 44 24 58       	mov    %rax,0x58(%rsp)
  401224:	31 c0                	xor    %eax,%eax
  401226:	48 89 e6             	mov    %rsp,%rsi
  401229:	e8 1a 05 00 00       	callq  401748 <read_six_numbers>
  40122e:	49 89 e4             	mov    %rsp,%r12
  401231:	41 bd 00 00 00 00    	mov    $0x0,%r13d
  401237:	4c 89 e5             	mov    %r12,%rbp
  40123a:	41 8b 04 24          	mov    (%r12),%eax
  40123e:	83 e8 01             	sub    $0x1,%eax
  401241:	83 f8 05             	cmp    $0x5,%eax
  401244:	76 05                	jbe    40124b <phase_6+0x3f>
  401246:	e8 c7 04 00 00       	callq  401712 <explode_bomb>
  40124b:	41 83 c5 01          	add    $0x1,%r13d
  40124f:	41 83 fd 06          	cmp    $0x6,%r13d
  401253:	74 3d                	je     401292 <phase_6+0x86>
  401255:	44 89 eb             	mov    %r13d,%ebx
  401258:	48 63 c3             	movslq %ebx,%rax
  40125b:	8b 04 84             	mov    (%rsp,%rax,4),%eax
  40125e:	39 45 00             	cmp    %eax,0x0(%rbp)
  401261:	75 05                	jne    401268 <phase_6+0x5c>
  401263:	e8 aa 04 00 00       	callq  401712 <explode_bomb>
  401268:	83 c3 01             	add    $0x1,%ebx
  40126b:	83 fb 05             	cmp    $0x5,%ebx
  40126e:	7e e8                	jle    401258 <phase_6+0x4c>
  401270:	49 83 c4 04          	add    $0x4,%r12
  401274:	eb c1                	jmp    401237 <phase_6+0x2b>
  401276:	48 8b 52 08          	mov    0x8(%rdx),%rdx
  40127a:	83 c0 01             	add    $0x1,%eax
  40127d:	39 c8                	cmp    %ecx,%eax
  40127f:	75 f5                	jne    401276 <phase_6+0x6a>
  401281:	48 89 54 74 20       	mov    %rdx,0x20(%rsp,%rsi,2)
  401286:	48 83 c6 04          	add    $0x4,%rsi
  40128a:	48 83 fe 18          	cmp    $0x18,%rsi
  40128e:	75 07                	jne    401297 <phase_6+0x8b>
  401290:	eb 19                	jmp    4012ab <phase_6+0x9f>
  401292:	be 00 00 00 00       	mov    $0x0,%esi
  401297:	8b 0c 34             	mov    (%rsp,%rsi,1),%ecx
  40129a:	b8 01 00 00 00       	mov    $0x1,%eax
  40129f:	ba f0 42 60 00       	mov    $0x6042f0,%edx
  4012a4:	83 f9 01             	cmp    $0x1,%ecx
  4012a7:	7f cd                	jg     401276 <phase_6+0x6a>
  4012a9:	eb d6                	jmp    401281 <phase_6+0x75>
  4012ab:	48 8b 5c 24 20       	mov    0x20(%rsp),%rbx
  4012b0:	48 8d 44 24 20       	lea    0x20(%rsp),%rax
  4012b5:	48 8d 74 24 48       	lea    0x48(%rsp),%rsi
  4012ba:	48 89 d9             	mov    %rbx,%rcx
  4012bd:	48 8b 50 08          	mov    0x8(%rax),%rdx
  4012c1:	48 89 51 08          	mov    %rdx,0x8(%rcx)
  4012c5:	48 83 c0 08          	add    $0x8,%rax
  4012c9:	48 89 d1             	mov    %rdx,%rcx
  4012cc:	48 39 f0             	cmp    %rsi,%rax
  4012cf:	75 ec                	jne    4012bd <phase_6+0xb1>
  4012d1:	48 c7 42 08 00 00 00 	movq   $0x0,0x8(%rdx)
  4012d8:	00 
  4012d9:	bd 05 00 00 00       	mov    $0x5,%ebp
  4012de:	48 8b 43 08          	mov    0x8(%rbx),%rax
  4012e2:	8b 00                	mov    (%rax),%eax
  4012e4:	39 03                	cmp    %eax,(%rbx)
  4012e6:	7d 05                	jge    4012ed <phase_6+0xe1>
  4012e8:	e8 25 04 00 00       	callq  401712 <explode_bomb>
  4012ed:	48 8b 5b 08          	mov    0x8(%rbx),%rbx
  4012f1:	83 ed 01             	sub    $0x1,%ebp
  4012f4:	75 e8                	jne    4012de <phase_6+0xd2>
  4012f6:	48 8b 44 24 58       	mov    0x58(%rsp),%rax
  4012fb:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401302:	00 00 
  401304:	74 05                	je     40130b <phase_6+0xff>
  401306:	e8 85 f8 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40130b:	48 83 c4 68          	add    $0x68,%rsp
  40130f:	5b                   	pop    %rbx
  401310:	5d                   	pop    %rbp
  401311:	41 5c                	pop    %r12
  401313:	41 5d                	pop    %r13
  401315:	c3                   	retq   

0000000000401316 <fun7>:
  401316:	48 83 ec 08          	sub    $0x8,%rsp
  40131a:	48 85 ff             	test   %rdi,%rdi
  40131d:	74 2b                	je     40134a <fun7+0x34>
  40131f:	8b 17                	mov    (%rdi),%edx
  401321:	39 f2                	cmp    %esi,%edx
  401323:	7e 0d                	jle    401332 <fun7+0x1c>
  401325:	48 8b 7f 08          	mov    0x8(%rdi),%rdi
  401329:	e8 e8 ff ff ff       	callq  401316 <fun7>
  40132e:	01 c0                	add    %eax,%eax
  401330:	eb 1d                	jmp    40134f <fun7+0x39>
  401332:	b8 00 00 00 00       	mov    $0x0,%eax
  401337:	39 f2                	cmp    %esi,%edx
  401339:	74 14                	je     40134f <fun7+0x39>
  40133b:	48 8b 7f 10          	mov    0x10(%rdi),%rdi
  40133f:	e8 d2 ff ff ff       	callq  401316 <fun7>
  401344:	8d 44 00 01          	lea    0x1(%rax,%rax,1),%eax
  401348:	eb 05                	jmp    40134f <fun7+0x39>
  40134a:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40134f:	48 83 c4 08          	add    $0x8,%rsp
  401353:	c3                   	retq   

0000000000401354 <secret_phase>:
  401354:	53                   	push   %rbx
  401355:	e8 2d 04 00 00       	callq  401787 <read_line>
  40135a:	ba 0a 00 00 00       	mov    $0xa,%edx
  40135f:	be 00 00 00 00       	mov    $0x0,%esi
  401364:	48 89 c7             	mov    %rax,%rdi
  401367:	e8 b4 f8 ff ff       	callq  400c20 <strtol@plt>
  40136c:	48 89 c3             	mov    %rax,%rbx
  40136f:	8d 40 ff             	lea    -0x1(%rax),%eax
  401372:	3d e8 03 00 00       	cmp    $0x3e8,%eax
  401377:	76 05                	jbe    40137e <secret_phase+0x2a>
  401379:	e8 94 03 00 00       	callq  401712 <explode_bomb>
  40137e:	89 de                	mov    %ebx,%esi
  401380:	bf 10 41 60 00       	mov    $0x604110,%edi
  401385:	e8 8c ff ff ff       	callq  401316 <fun7>
  40138a:	83 f8 06             	cmp    $0x6,%eax
  40138d:	74 05                	je     401394 <secret_phase+0x40>
  40138f:	e8 7e 03 00 00       	callq  401712 <explode_bomb>
  401394:	bf f8 26 40 00       	mov    $0x4026f8,%edi
  401399:	e8 d2 f7 ff ff       	callq  400b70 <puts@plt>
  40139e:	e8 0a 05 00 00       	callq  4018ad <phase_defused>
  4013a3:	5b                   	pop    %rbx
  4013a4:	c3                   	retq   

00000000004013a5 <sig_handler>:
  4013a5:	48 83 ec 08          	sub    $0x8,%rsp
  4013a9:	bf c0 27 40 00       	mov    $0x4027c0,%edi
  4013ae:	e8 bd f7 ff ff       	callq  400b70 <puts@plt>
  4013b3:	bf 03 00 00 00       	mov    $0x3,%edi
  4013b8:	e8 f3 f8 ff ff       	callq  400cb0 <sleep@plt>
  4013bd:	be 89 29 40 00       	mov    $0x402989,%esi
  4013c2:	bf 01 00 00 00       	mov    $0x1,%edi
  4013c7:	b8 00 00 00 00       	mov    $0x0,%eax
  4013cc:	e8 7f f8 ff ff       	callq  400c50 <__printf_chk@plt>
  4013d1:	48 8b 3d a8 33 20 00 	mov    0x2033a8(%rip),%rdi        # 604780 <__TMC_END__>
  4013d8:	e8 53 f8 ff ff       	callq  400c30 <fflush@plt>
  4013dd:	bf 01 00 00 00       	mov    $0x1,%edi
  4013e2:	e8 c9 f8 ff ff       	callq  400cb0 <sleep@plt>
  4013e7:	bf 91 29 40 00       	mov    $0x402991,%edi
  4013ec:	e8 7f f7 ff ff       	callq  400b70 <puts@plt>
  4013f1:	bf 10 00 00 00       	mov    $0x10,%edi
  4013f6:	e8 85 f8 ff ff       	callq  400c80 <exit@plt>

00000000004013fb <invalid_phase>:
  4013fb:	48 83 ec 08          	sub    $0x8,%rsp
  4013ff:	48 89 fa             	mov    %rdi,%rdx
  401402:	be 99 29 40 00       	mov    $0x402999,%esi
  401407:	bf 01 00 00 00       	mov    $0x1,%edi
  40140c:	b8 00 00 00 00       	mov    $0x0,%eax
  401411:	e8 3a f8 ff ff       	callq  400c50 <__printf_chk@plt>
  401416:	bf 08 00 00 00       	mov    $0x8,%edi
  40141b:	e8 60 f8 ff ff       	callq  400c80 <exit@plt>

0000000000401420 <string_length>:
  401420:	80 3f 00             	cmpb   $0x0,(%rdi)
  401423:	74 13                	je     401438 <string_length+0x18>
  401425:	b8 00 00 00 00       	mov    $0x0,%eax
  40142a:	48 83 c7 01          	add    $0x1,%rdi
  40142e:	83 c0 01             	add    $0x1,%eax
  401431:	80 3f 00             	cmpb   $0x0,(%rdi)
  401434:	75 f4                	jne    40142a <string_length+0xa>
  401436:	f3 c3                	repz retq 
  401438:	b8 00 00 00 00       	mov    $0x0,%eax
  40143d:	c3                   	retq   

000000000040143e <strings_not_equal>:
  40143e:	41 54                	push   %r12
  401440:	55                   	push   %rbp
  401441:	53                   	push   %rbx
  401442:	48 89 fb             	mov    %rdi,%rbx
  401445:	48 89 f5             	mov    %rsi,%rbp
  401448:	e8 d3 ff ff ff       	callq  401420 <string_length>
  40144d:	41 89 c4             	mov    %eax,%r12d
  401450:	48 89 ef             	mov    %rbp,%rdi
  401453:	e8 c8 ff ff ff       	callq  401420 <string_length>
  401458:	ba 01 00 00 00       	mov    $0x1,%edx
  40145d:	41 39 c4             	cmp    %eax,%r12d
  401460:	75 3c                	jne    40149e <strings_not_equal+0x60>
  401462:	0f b6 03             	movzbl (%rbx),%eax
  401465:	84 c0                	test   %al,%al
  401467:	74 22                	je     40148b <strings_not_equal+0x4d>
  401469:	3a 45 00             	cmp    0x0(%rbp),%al
  40146c:	74 07                	je     401475 <strings_not_equal+0x37>
  40146e:	eb 22                	jmp    401492 <strings_not_equal+0x54>
  401470:	3a 45 00             	cmp    0x0(%rbp),%al
  401473:	75 24                	jne    401499 <strings_not_equal+0x5b>
  401475:	48 83 c3 01          	add    $0x1,%rbx
  401479:	48 83 c5 01          	add    $0x1,%rbp
  40147d:	0f b6 03             	movzbl (%rbx),%eax
  401480:	84 c0                	test   %al,%al
  401482:	75 ec                	jne    401470 <strings_not_equal+0x32>
  401484:	ba 00 00 00 00       	mov    $0x0,%edx
  401489:	eb 13                	jmp    40149e <strings_not_equal+0x60>
  40148b:	ba 00 00 00 00       	mov    $0x0,%edx
  401490:	eb 0c                	jmp    40149e <strings_not_equal+0x60>
  401492:	ba 01 00 00 00       	mov    $0x1,%edx
  401497:	eb 05                	jmp    40149e <strings_not_equal+0x60>
  401499:	ba 01 00 00 00       	mov    $0x1,%edx
  40149e:	89 d0                	mov    %edx,%eax
  4014a0:	5b                   	pop    %rbx
  4014a1:	5d                   	pop    %rbp
  4014a2:	41 5c                	pop    %r12
  4014a4:	c3                   	retq   

00000000004014a5 <initialize_bomb>:
  4014a5:	53                   	push   %rbx
  4014a6:	48 81 ec 50 20 00 00 	sub    $0x2050,%rsp
  4014ad:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4014b4:	00 00 
  4014b6:	48 89 84 24 48 20 00 	mov    %rax,0x2048(%rsp)
  4014bd:	00 
  4014be:	31 c0                	xor    %eax,%eax
  4014c0:	be a5 13 40 00       	mov    $0x4013a5,%esi
  4014c5:	bf 02 00 00 00       	mov    $0x2,%edi
  4014ca:	e8 21 f7 ff ff       	callq  400bf0 <signal@plt>
  4014cf:	be 40 00 00 00       	mov    $0x40,%esi
  4014d4:	48 89 e7             	mov    %rsp,%rdi
  4014d7:	e8 94 f7 ff ff       	callq  400c70 <gethostname@plt>
  4014dc:	85 c0                	test   %eax,%eax
  4014de:	75 13                	jne    4014f3 <initialize_bomb+0x4e>
  4014e0:	48 8b 3d 99 2e 20 00 	mov    0x202e99(%rip),%rdi        # 604380 <host_table>
  4014e7:	bb 88 43 60 00       	mov    $0x604388,%ebx
  4014ec:	48 85 ff             	test   %rdi,%rdi
  4014ef:	75 16                	jne    401507 <initialize_bomb+0x62>
  4014f1:	eb 52                	jmp    401545 <initialize_bomb+0xa0>
  4014f3:	bf f8 27 40 00       	mov    $0x4027f8,%edi
  4014f8:	e8 73 f6 ff ff       	callq  400b70 <puts@plt>
  4014fd:	bf 08 00 00 00       	mov    $0x8,%edi
  401502:	e8 79 f7 ff ff       	callq  400c80 <exit@plt>
  401507:	48 89 e6             	mov    %rsp,%rsi
  40150a:	e8 31 f6 ff ff       	callq  400b40 <strcasecmp@plt>
  40150f:	85 c0                	test   %eax,%eax
  401511:	74 46                	je     401559 <initialize_bomb+0xb4>
  401513:	48 83 c3 08          	add    $0x8,%rbx
  401517:	48 8b 7b f8          	mov    -0x8(%rbx),%rdi
  40151b:	48 85 ff             	test   %rdi,%rdi
  40151e:	75 e7                	jne    401507 <initialize_bomb+0x62>
  401520:	eb 23                	jmp    401545 <initialize_bomb+0xa0>
  401522:	48 8d 54 24 40       	lea    0x40(%rsp),%rdx
  401527:	be aa 29 40 00       	mov    $0x4029aa,%esi
  40152c:	bf 01 00 00 00       	mov    $0x1,%edi
  401531:	b8 00 00 00 00       	mov    $0x0,%eax
  401536:	e8 15 f7 ff ff       	callq  400c50 <__printf_chk@plt>
  40153b:	bf 08 00 00 00       	mov    $0x8,%edi
  401540:	e8 3b f7 ff ff       	callq  400c80 <exit@plt>
  401545:	bf 30 28 40 00       	mov    $0x402830,%edi
  40154a:	e8 21 f6 ff ff       	callq  400b70 <puts@plt>
  40154f:	bf 08 00 00 00       	mov    $0x8,%edi
  401554:	e8 27 f7 ff ff       	callq  400c80 <exit@plt>
  401559:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40155e:	e8 49 0d 00 00       	callq  4022ac <init_driver>
  401563:	85 c0                	test   %eax,%eax
  401565:	78 bb                	js     401522 <initialize_bomb+0x7d>
  401567:	48 8b 84 24 48 20 00 	mov    0x2048(%rsp),%rax
  40156e:	00 
  40156f:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401576:	00 00 
  401578:	74 05                	je     40157f <initialize_bomb+0xda>
  40157a:	e8 11 f6 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40157f:	48 81 c4 50 20 00 00 	add    $0x2050,%rsp
  401586:	5b                   	pop    %rbx
  401587:	c3                   	retq   

0000000000401588 <initialize_bomb_solve>:
  401588:	f3 c3                	repz retq 

000000000040158a <blank_line>:
  40158a:	55                   	push   %rbp
  40158b:	53                   	push   %rbx
  40158c:	48 83 ec 08          	sub    $0x8,%rsp
  401590:	48 89 fd             	mov    %rdi,%rbp
  401593:	eb 17                	jmp    4015ac <blank_line+0x22>
  401595:	e8 26 f7 ff ff       	callq  400cc0 <__ctype_b_loc@plt>
  40159a:	48 83 c5 01          	add    $0x1,%rbp
  40159e:	48 0f be db          	movsbq %bl,%rbx
  4015a2:	48 8b 00             	mov    (%rax),%rax
  4015a5:	f6 44 58 01 20       	testb  $0x20,0x1(%rax,%rbx,2)
  4015aa:	74 0f                	je     4015bb <blank_line+0x31>
  4015ac:	0f b6 5d 00          	movzbl 0x0(%rbp),%ebx
  4015b0:	84 db                	test   %bl,%bl
  4015b2:	75 e1                	jne    401595 <blank_line+0xb>
  4015b4:	b8 01 00 00 00       	mov    $0x1,%eax
  4015b9:	eb 05                	jmp    4015c0 <blank_line+0x36>
  4015bb:	b8 00 00 00 00       	mov    $0x0,%eax
  4015c0:	48 83 c4 08          	add    $0x8,%rsp
  4015c4:	5b                   	pop    %rbx
  4015c5:	5d                   	pop    %rbp
  4015c6:	c3                   	retq   

00000000004015c7 <skip>:
  4015c7:	53                   	push   %rbx
  4015c8:	48 63 05 dd 31 20 00 	movslq 0x2031dd(%rip),%rax        # 6047ac <num_input_strings>
  4015cf:	48 8d 3c 80          	lea    (%rax,%rax,4),%rdi
  4015d3:	48 c1 e7 04          	shl    $0x4,%rdi
  4015d7:	48 81 c7 c0 47 60 00 	add    $0x6047c0,%rdi
  4015de:	48 8b 15 cb 31 20 00 	mov    0x2031cb(%rip),%rdx        # 6047b0 <infile>
  4015e5:	be 50 00 00 00       	mov    $0x50,%esi
  4015ea:	e8 f1 f5 ff ff       	callq  400be0 <fgets@plt>
  4015ef:	48 89 c3             	mov    %rax,%rbx
  4015f2:	48 85 c0             	test   %rax,%rax
  4015f5:	74 0c                	je     401603 <skip+0x3c>
  4015f7:	48 89 c7             	mov    %rax,%rdi
  4015fa:	e8 8b ff ff ff       	callq  40158a <blank_line>
  4015ff:	85 c0                	test   %eax,%eax
  401601:	75 c5                	jne    4015c8 <skip+0x1>
  401603:	48 89 d8             	mov    %rbx,%rax
  401606:	5b                   	pop    %rbx
  401607:	c3                   	retq   

0000000000401608 <send_msg>:
  401608:	48 81 ec 18 40 00 00 	sub    $0x4018,%rsp
  40160f:	41 89 f8             	mov    %edi,%r8d
  401612:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401619:	00 00 
  40161b:	48 89 84 24 08 40 00 	mov    %rax,0x4008(%rsp)
  401622:	00 
  401623:	31 c0                	xor    %eax,%eax
  401625:	8b 35 81 31 20 00    	mov    0x203181(%rip),%esi        # 6047ac <num_input_strings>
  40162b:	8d 46 ff             	lea    -0x1(%rsi),%eax
  40162e:	48 98                	cltq   
  401630:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401634:	48 c1 e2 04          	shl    $0x4,%rdx
  401638:	48 81 c2 c0 47 60 00 	add    $0x6047c0,%rdx
  40163f:	b8 00 00 00 00       	mov    $0x0,%eax
  401644:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40164b:	48 89 d7             	mov    %rdx,%rdi
  40164e:	f2 ae                	repnz scas %es:(%rdi),%al
  401650:	48 f7 d1             	not    %rcx
  401653:	48 83 c1 63          	add    $0x63,%rcx
  401657:	48 81 f9 00 20 00 00 	cmp    $0x2000,%rcx
  40165e:	76 19                	jbe    401679 <send_msg+0x71>
  401660:	be 68 28 40 00       	mov    $0x402868,%esi
  401665:	bf 01 00 00 00       	mov    $0x1,%edi
  40166a:	e8 e1 f5 ff ff       	callq  400c50 <__printf_chk@plt>
  40166f:	bf 08 00 00 00       	mov    $0x8,%edi
  401674:	e8 07 f6 ff ff       	callq  400c80 <exit@plt>
  401679:	45 85 c0             	test   %r8d,%r8d
  40167c:	41 b9 cc 29 40 00    	mov    $0x4029cc,%r9d
  401682:	b8 c4 29 40 00       	mov    $0x4029c4,%eax
  401687:	4c 0f 45 c8          	cmovne %rax,%r9
  40168b:	52                   	push   %rdx
  40168c:	56                   	push   %rsi
  40168d:	44 8b 05 e0 2c 20 00 	mov    0x202ce0(%rip),%r8d        # 604374 <bomb_id>
  401694:	b9 d5 29 40 00       	mov    $0x4029d5,%ecx
  401699:	ba 00 20 00 00       	mov    $0x2000,%edx
  40169e:	be 01 00 00 00       	mov    $0x1,%esi
  4016a3:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  4016a8:	b8 00 00 00 00       	mov    $0x0,%eax
  4016ad:	e8 1e f6 ff ff       	callq  400cd0 <__sprintf_chk@plt>
  4016b2:	4c 8d 84 24 10 20 00 	lea    0x2010(%rsp),%r8
  4016b9:	00 
  4016ba:	b9 00 00 00 00       	mov    $0x0,%ecx
  4016bf:	48 8d 54 24 10       	lea    0x10(%rsp),%rdx
  4016c4:	be 50 43 60 00       	mov    $0x604350,%esi
  4016c9:	bf 68 43 60 00       	mov    $0x604368,%edi
  4016ce:	e8 ae 0d 00 00       	callq  402481 <driver_post>
  4016d3:	48 83 c4 10          	add    $0x10,%rsp
  4016d7:	85 c0                	test   %eax,%eax
  4016d9:	79 17                	jns    4016f2 <send_msg+0xea>
  4016db:	48 8d bc 24 00 20 00 	lea    0x2000(%rsp),%rdi
  4016e2:	00 
  4016e3:	e8 88 f4 ff ff       	callq  400b70 <puts@plt>
  4016e8:	bf 00 00 00 00       	mov    $0x0,%edi
  4016ed:	e8 8e f5 ff ff       	callq  400c80 <exit@plt>
  4016f2:	48 8b 84 24 08 40 00 	mov    0x4008(%rsp),%rax
  4016f9:	00 
  4016fa:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  401701:	00 00 
  401703:	74 05                	je     40170a <send_msg+0x102>
  401705:	e8 86 f4 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40170a:	48 81 c4 18 40 00 00 	add    $0x4018,%rsp
  401711:	c3                   	retq   

0000000000401712 <explode_bomb>:
  401712:	48 83 ec 08          	sub    $0x8,%rsp
  401716:	bf e1 29 40 00       	mov    $0x4029e1,%edi
  40171b:	e8 50 f4 ff ff       	callq  400b70 <puts@plt>
  401720:	bf ea 29 40 00       	mov    $0x4029ea,%edi
  401725:	e8 46 f4 ff ff       	callq  400b70 <puts@plt>
  40172a:	bf 00 00 00 00       	mov    $0x0,%edi
  40172f:	e8 d4 fe ff ff       	callq  401608 <send_msg>
  401734:	bf 90 28 40 00       	mov    $0x402890,%edi
  401739:	e8 32 f4 ff ff       	callq  400b70 <puts@plt>
  40173e:	bf 08 00 00 00       	mov    $0x8,%edi
  401743:	e8 38 f5 ff ff       	callq  400c80 <exit@plt>

0000000000401748 <read_six_numbers>:
  401748:	48 83 ec 08          	sub    $0x8,%rsp
  40174c:	48 89 f2             	mov    %rsi,%rdx
  40174f:	48 8d 4e 04          	lea    0x4(%rsi),%rcx
  401753:	48 8d 46 14          	lea    0x14(%rsi),%rax
  401757:	50                   	push   %rax
  401758:	48 8d 46 10          	lea    0x10(%rsi),%rax
  40175c:	50                   	push   %rax
  40175d:	4c 8d 4e 0c          	lea    0xc(%rsi),%r9
  401761:	4c 8d 46 08          	lea    0x8(%rsi),%r8
  401765:	be 01 2a 40 00       	mov    $0x402a01,%esi
  40176a:	b8 00 00 00 00       	mov    $0x0,%eax
  40176f:	e8 cc f4 ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  401774:	48 83 c4 10          	add    $0x10,%rsp
  401778:	83 f8 05             	cmp    $0x5,%eax
  40177b:	7f 05                	jg     401782 <read_six_numbers+0x3a>
  40177d:	e8 90 ff ff ff       	callq  401712 <explode_bomb>
  401782:	48 83 c4 08          	add    $0x8,%rsp
  401786:	c3                   	retq   

0000000000401787 <read_line>:
  401787:	48 83 ec 08          	sub    $0x8,%rsp
  40178b:	b8 00 00 00 00       	mov    $0x0,%eax
  401790:	e8 32 fe ff ff       	callq  4015c7 <skip>
  401795:	48 85 c0             	test   %rax,%rax
  401798:	75 6e                	jne    401808 <read_line+0x81>
  40179a:	48 8b 05 ef 2f 20 00 	mov    0x202fef(%rip),%rax        # 604790 <stdin@@GLIBC_2.2.5>
  4017a1:	48 39 05 08 30 20 00 	cmp    %rax,0x203008(%rip)        # 6047b0 <infile>
  4017a8:	75 14                	jne    4017be <read_line+0x37>
  4017aa:	bf 13 2a 40 00       	mov    $0x402a13,%edi
  4017af:	e8 bc f3 ff ff       	callq  400b70 <puts@plt>
  4017b4:	bf 08 00 00 00       	mov    $0x8,%edi
  4017b9:	e8 c2 f4 ff ff       	callq  400c80 <exit@plt>
  4017be:	bf 31 2a 40 00       	mov    $0x402a31,%edi
  4017c3:	e8 68 f3 ff ff       	callq  400b30 <getenv@plt>
  4017c8:	48 85 c0             	test   %rax,%rax
  4017cb:	74 0a                	je     4017d7 <read_line+0x50>
  4017cd:	bf 00 00 00 00       	mov    $0x0,%edi
  4017d2:	e8 a9 f4 ff ff       	callq  400c80 <exit@plt>
  4017d7:	48 8b 05 b2 2f 20 00 	mov    0x202fb2(%rip),%rax        # 604790 <stdin@@GLIBC_2.2.5>
  4017de:	48 89 05 cb 2f 20 00 	mov    %rax,0x202fcb(%rip)        # 6047b0 <infile>
  4017e5:	b8 00 00 00 00       	mov    $0x0,%eax
  4017ea:	e8 d8 fd ff ff       	callq  4015c7 <skip>
  4017ef:	48 85 c0             	test   %rax,%rax
  4017f2:	75 14                	jne    401808 <read_line+0x81>
  4017f4:	bf 13 2a 40 00       	mov    $0x402a13,%edi
  4017f9:	e8 72 f3 ff ff       	callq  400b70 <puts@plt>
  4017fe:	bf 00 00 00 00       	mov    $0x0,%edi
  401803:	e8 78 f4 ff ff       	callq  400c80 <exit@plt>
  401808:	8b 35 9e 2f 20 00    	mov    0x202f9e(%rip),%esi        # 6047ac <num_input_strings>
  40180e:	48 63 c6             	movslq %esi,%rax
  401811:	48 8d 14 80          	lea    (%rax,%rax,4),%rdx
  401815:	48 c1 e2 04          	shl    $0x4,%rdx
  401819:	48 81 c2 c0 47 60 00 	add    $0x6047c0,%rdx
  401820:	b8 00 00 00 00       	mov    $0x0,%eax
  401825:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  40182c:	48 89 d7             	mov    %rdx,%rdi
  40182f:	f2 ae                	repnz scas %es:(%rdi),%al
  401831:	48 f7 d1             	not    %rcx
  401834:	48 83 e9 01          	sub    $0x1,%rcx
  401838:	83 f9 4e             	cmp    $0x4e,%ecx
  40183b:	7e 46                	jle    401883 <read_line+0xfc>
  40183d:	bf 3c 2a 40 00       	mov    $0x402a3c,%edi
  401842:	e8 29 f3 ff ff       	callq  400b70 <puts@plt>
  401847:	8b 05 5f 2f 20 00    	mov    0x202f5f(%rip),%eax        # 6047ac <num_input_strings>
  40184d:	8d 50 01             	lea    0x1(%rax),%edx
  401850:	89 15 56 2f 20 00    	mov    %edx,0x202f56(%rip)        # 6047ac <num_input_strings>
  401856:	48 98                	cltq   
  401858:	48 6b c0 50          	imul   $0x50,%rax,%rax
  40185c:	48 bf 2a 2a 2a 74 72 	movabs $0x636e7572742a2a2a,%rdi
  401863:	75 6e 63 
  401866:	48 89 b8 c0 47 60 00 	mov    %rdi,0x6047c0(%rax)
  40186d:	48 bf 61 74 65 64 2a 	movabs $0x2a2a2a64657461,%rdi
  401874:	2a 2a 00 
  401877:	48 89 b8 c8 47 60 00 	mov    %rdi,0x6047c8(%rax)
  40187e:	e8 8f fe ff ff       	callq  401712 <explode_bomb>
  401883:	83 e9 01             	sub    $0x1,%ecx
  401886:	48 63 c9             	movslq %ecx,%rcx
  401889:	48 63 c6             	movslq %esi,%rax
  40188c:	48 8d 04 80          	lea    (%rax,%rax,4),%rax
  401890:	48 c1 e0 04          	shl    $0x4,%rax
  401894:	c6 84 01 c0 47 60 00 	movb   $0x0,0x6047c0(%rcx,%rax,1)
  40189b:	00 
  40189c:	8d 46 01             	lea    0x1(%rsi),%eax
  40189f:	89 05 07 2f 20 00    	mov    %eax,0x202f07(%rip)        # 6047ac <num_input_strings>
  4018a5:	48 89 d0             	mov    %rdx,%rax
  4018a8:	48 83 c4 08          	add    $0x8,%rsp
  4018ac:	c3                   	retq   

00000000004018ad <phase_defused>:
  4018ad:	48 83 ec 78          	sub    $0x78,%rsp
  4018b1:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4018b8:	00 00 
  4018ba:	48 89 44 24 68       	mov    %rax,0x68(%rsp)
  4018bf:	31 c0                	xor    %eax,%eax
  4018c1:	bf 01 00 00 00       	mov    $0x1,%edi
  4018c6:	e8 3d fd ff ff       	callq  401608 <send_msg>
  4018cb:	83 3d da 2e 20 00 06 	cmpl   $0x6,0x202eda(%rip)        # 6047ac <num_input_strings>
  4018d2:	75 6d                	jne    401941 <phase_defused+0x94>
  4018d4:	4c 8d 44 24 10       	lea    0x10(%rsp),%r8
  4018d9:	48 8d 4c 24 0c       	lea    0xc(%rsp),%rcx
  4018de:	48 8d 54 24 08       	lea    0x8(%rsp),%rdx
  4018e3:	be 57 2a 40 00       	mov    $0x402a57,%esi
  4018e8:	bf b0 48 60 00       	mov    $0x6048b0,%edi
  4018ed:	b8 00 00 00 00       	mov    $0x0,%eax
  4018f2:	e8 49 f3 ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  4018f7:	83 f8 03             	cmp    $0x3,%eax
  4018fa:	75 31                	jne    40192d <phase_defused+0x80>
  4018fc:	be 60 2a 40 00       	mov    $0x402a60,%esi
  401901:	48 8d 7c 24 10       	lea    0x10(%rsp),%rdi
  401906:	e8 33 fb ff ff       	callq  40143e <strings_not_equal>
  40190b:	85 c0                	test   %eax,%eax
  40190d:	75 1e                	jne    40192d <phase_defused+0x80>
  40190f:	bf b8 28 40 00       	mov    $0x4028b8,%edi
  401914:	e8 57 f2 ff ff       	callq  400b70 <puts@plt>
  401919:	bf e0 28 40 00       	mov    $0x4028e0,%edi
  40191e:	e8 4d f2 ff ff       	callq  400b70 <puts@plt>
  401923:	b8 00 00 00 00       	mov    $0x0,%eax
  401928:	e8 27 fa ff ff       	callq  401354 <secret_phase>
  40192d:	bf 18 29 40 00       	mov    $0x402918,%edi
  401932:	e8 39 f2 ff ff       	callq  400b70 <puts@plt>
  401937:	bf 48 29 40 00       	mov    $0x402948,%edi
  40193c:	e8 2f f2 ff ff       	callq  400b70 <puts@plt>
  401941:	48 8b 44 24 68       	mov    0x68(%rsp),%rax
  401946:	64 48 33 04 25 28 00 	xor    %fs:0x28,%rax
  40194d:	00 00 
  40194f:	74 05                	je     401956 <phase_defused+0xa9>
  401951:	e8 3a f2 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401956:	48 83 c4 78          	add    $0x78,%rsp
  40195a:	c3                   	retq   

000000000040195b <sigalrm_handler>:
  40195b:	48 83 ec 08          	sub    $0x8,%rsp
  40195f:	b9 00 00 00 00       	mov    $0x0,%ecx
  401964:	ba 68 2d 40 00       	mov    $0x402d68,%edx
  401969:	be 01 00 00 00       	mov    $0x1,%esi
  40196e:	48 8b 3d 2b 2e 20 00 	mov    0x202e2b(%rip),%rdi        # 6047a0 <stderr@@GLIBC_2.2.5>
  401975:	b8 00 00 00 00       	mov    $0x0,%eax
  40197a:	e8 21 f3 ff ff       	callq  400ca0 <__fprintf_chk@plt>
  40197f:	bf 01 00 00 00       	mov    $0x1,%edi
  401984:	e8 f7 f2 ff ff       	callq  400c80 <exit@plt>

0000000000401989 <rio_readlineb>:
  401989:	41 56                	push   %r14
  40198b:	41 55                	push   %r13
  40198d:	41 54                	push   %r12
  40198f:	55                   	push   %rbp
  401990:	53                   	push   %rbx
  401991:	48 83 ec 10          	sub    $0x10,%rsp
  401995:	48 89 fb             	mov    %rdi,%rbx
  401998:	49 89 f5             	mov    %rsi,%r13
  40199b:	49 89 d6             	mov    %rdx,%r14
  40199e:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4019a5:	00 00 
  4019a7:	48 89 44 24 08       	mov    %rax,0x8(%rsp)
  4019ac:	31 c0                	xor    %eax,%eax
  4019ae:	41 bc 01 00 00 00    	mov    $0x1,%r12d
  4019b4:	48 8d 6f 10          	lea    0x10(%rdi),%rbp
  4019b8:	48 83 fa 01          	cmp    $0x1,%rdx
  4019bc:	77 2c                	ja     4019ea <rio_readlineb+0x61>
  4019be:	eb 6d                	jmp    401a2d <rio_readlineb+0xa4>
  4019c0:	ba 00 20 00 00       	mov    $0x2000,%edx
  4019c5:	48 89 ee             	mov    %rbp,%rsi
  4019c8:	8b 3b                	mov    (%rbx),%edi
  4019ca:	e8 f1 f1 ff ff       	callq  400bc0 <read@plt>
  4019cf:	89 43 04             	mov    %eax,0x4(%rbx)
  4019d2:	85 c0                	test   %eax,%eax
  4019d4:	79 0c                	jns    4019e2 <rio_readlineb+0x59>
  4019d6:	e8 75 f1 ff ff       	callq  400b50 <__errno_location@plt>
  4019db:	83 38 04             	cmpl   $0x4,(%rax)
  4019de:	74 0a                	je     4019ea <rio_readlineb+0x61>
  4019e0:	eb 6c                	jmp    401a4e <rio_readlineb+0xc5>
  4019e2:	85 c0                	test   %eax,%eax
  4019e4:	74 71                	je     401a57 <rio_readlineb+0xce>
  4019e6:	48 89 6b 08          	mov    %rbp,0x8(%rbx)
  4019ea:	8b 43 04             	mov    0x4(%rbx),%eax
  4019ed:	85 c0                	test   %eax,%eax
  4019ef:	7e cf                	jle    4019c0 <rio_readlineb+0x37>
  4019f1:	48 8b 53 08          	mov    0x8(%rbx),%rdx
  4019f5:	0f b6 0a             	movzbl (%rdx),%ecx
  4019f8:	88 4c 24 07          	mov    %cl,0x7(%rsp)
  4019fc:	48 83 c2 01          	add    $0x1,%rdx
  401a00:	48 89 53 08          	mov    %rdx,0x8(%rbx)
  401a04:	83 e8 01             	sub    $0x1,%eax
  401a07:	89 43 04             	mov    %eax,0x4(%rbx)
  401a0a:	49 83 c5 01          	add    $0x1,%r13
  401a0e:	41 88 4d ff          	mov    %cl,-0x1(%r13)
  401a12:	80 f9 0a             	cmp    $0xa,%cl
  401a15:	75 0a                	jne    401a21 <rio_readlineb+0x98>
  401a17:	eb 14                	jmp    401a2d <rio_readlineb+0xa4>
  401a19:	41 83 fc 01          	cmp    $0x1,%r12d
  401a1d:	75 0e                	jne    401a2d <rio_readlineb+0xa4>
  401a1f:	eb 16                	jmp    401a37 <rio_readlineb+0xae>
  401a21:	41 83 c4 01          	add    $0x1,%r12d
  401a25:	49 63 c4             	movslq %r12d,%rax
  401a28:	4c 39 f0             	cmp    %r14,%rax
  401a2b:	72 bd                	jb     4019ea <rio_readlineb+0x61>
  401a2d:	41 c6 45 00 00       	movb   $0x0,0x0(%r13)
  401a32:	49 63 c4             	movslq %r12d,%rax
  401a35:	eb 05                	jmp    401a3c <rio_readlineb+0xb3>
  401a37:	b8 00 00 00 00       	mov    $0x0,%eax
  401a3c:	48 8b 4c 24 08       	mov    0x8(%rsp),%rcx
  401a41:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  401a48:	00 00 
  401a4a:	74 22                	je     401a6e <rio_readlineb+0xe5>
  401a4c:	eb 1b                	jmp    401a69 <rio_readlineb+0xe0>
  401a4e:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a55:	eb 05                	jmp    401a5c <rio_readlineb+0xd3>
  401a57:	b8 00 00 00 00       	mov    $0x0,%eax
  401a5c:	85 c0                	test   %eax,%eax
  401a5e:	74 b9                	je     401a19 <rio_readlineb+0x90>
  401a60:	48 c7 c0 ff ff ff ff 	mov    $0xffffffffffffffff,%rax
  401a67:	eb d3                	jmp    401a3c <rio_readlineb+0xb3>
  401a69:	e8 22 f1 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  401a6e:	48 83 c4 10          	add    $0x10,%rsp
  401a72:	5b                   	pop    %rbx
  401a73:	5d                   	pop    %rbp
  401a74:	41 5c                	pop    %r12
  401a76:	41 5d                	pop    %r13
  401a78:	41 5e                	pop    %r14
  401a7a:	c3                   	retq   

0000000000401a7b <submitr>:
  401a7b:	41 57                	push   %r15
  401a7d:	41 56                	push   %r14
  401a7f:	41 55                	push   %r13
  401a81:	41 54                	push   %r12
  401a83:	55                   	push   %rbp
  401a84:	53                   	push   %rbx
  401a85:	48 81 ec 68 a0 00 00 	sub    $0xa068,%rsp
  401a8c:	49 89 fd             	mov    %rdi,%r13
  401a8f:	89 f5                	mov    %esi,%ebp
  401a91:	48 89 14 24          	mov    %rdx,(%rsp)
  401a95:	48 89 4c 24 08       	mov    %rcx,0x8(%rsp)
  401a9a:	4c 89 44 24 18       	mov    %r8,0x18(%rsp)
  401a9f:	4c 89 4c 24 10       	mov    %r9,0x10(%rsp)
  401aa4:	48 8b 9c 24 a0 a0 00 	mov    0xa0a0(%rsp),%rbx
  401aab:	00 
  401aac:	4c 8b bc 24 a8 a0 00 	mov    0xa0a8(%rsp),%r15
  401ab3:	00 
  401ab4:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  401abb:	00 00 
  401abd:	48 89 84 24 58 a0 00 	mov    %rax,0xa058(%rsp)
  401ac4:	00 
  401ac5:	31 c0                	xor    %eax,%eax
  401ac7:	c7 44 24 2c 00 00 00 	movl   $0x0,0x2c(%rsp)
  401ace:	00 
  401acf:	ba 00 00 00 00       	mov    $0x0,%edx
  401ad4:	be 01 00 00 00       	mov    $0x1,%esi
  401ad9:	bf 02 00 00 00       	mov    $0x2,%edi
  401ade:	e8 fd f1 ff ff       	callq  400ce0 <socket@plt>
  401ae3:	85 c0                	test   %eax,%eax
  401ae5:	79 50                	jns    401b37 <submitr+0xbc>
  401ae7:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401aee:	3a 20 43 
  401af1:	49 89 07             	mov    %rax,(%r15)
  401af4:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401afb:	20 75 6e 
  401afe:	49 89 47 08          	mov    %rax,0x8(%r15)
  401b02:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b09:	74 6f 20 
  401b0c:	49 89 47 10          	mov    %rax,0x10(%r15)
  401b10:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  401b17:	65 20 73 
  401b1a:	49 89 47 18          	mov    %rax,0x18(%r15)
  401b1e:	41 c7 47 20 6f 63 6b 	movl   $0x656b636f,0x20(%r15)
  401b25:	65 
  401b26:	66 41 c7 47 24 74 00 	movw   $0x74,0x24(%r15)
  401b2d:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401b32:	e9 12 06 00 00       	jmpq   402149 <submitr+0x6ce>
  401b37:	41 89 c4             	mov    %eax,%r12d
  401b3a:	4c 89 ef             	mov    %r13,%rdi
  401b3d:	e8 be f0 ff ff       	callq  400c00 <gethostbyname@plt>
  401b42:	48 85 c0             	test   %rax,%rax
  401b45:	75 6b                	jne    401bb2 <submitr+0x137>
  401b47:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  401b4e:	3a 20 44 
  401b51:	49 89 07             	mov    %rax,(%r15)
  401b54:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  401b5b:	20 75 6e 
  401b5e:	49 89 47 08          	mov    %rax,0x8(%r15)
  401b62:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401b69:	74 6f 20 
  401b6c:	49 89 47 10          	mov    %rax,0x10(%r15)
  401b70:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  401b77:	76 65 20 
  401b7a:	49 89 47 18          	mov    %rax,0x18(%r15)
  401b7e:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  401b85:	72 20 61 
  401b88:	49 89 47 20          	mov    %rax,0x20(%r15)
  401b8c:	41 c7 47 28 64 64 72 	movl   $0x65726464,0x28(%r15)
  401b93:	65 
  401b94:	66 41 c7 47 2c 73 73 	movw   $0x7373,0x2c(%r15)
  401b9b:	41 c6 47 2e 00       	movb   $0x0,0x2e(%r15)
  401ba0:	44 89 e7             	mov    %r12d,%edi
  401ba3:	e8 08 f0 ff ff       	callq  400bb0 <close@plt>
  401ba8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401bad:	e9 97 05 00 00       	jmpq   402149 <submitr+0x6ce>
  401bb2:	48 c7 44 24 30 00 00 	movq   $0x0,0x30(%rsp)
  401bb9:	00 00 
  401bbb:	48 c7 44 24 38 00 00 	movq   $0x0,0x38(%rsp)
  401bc2:	00 00 
  401bc4:	66 c7 44 24 30 02 00 	movw   $0x2,0x30(%rsp)
  401bcb:	48 63 50 14          	movslq 0x14(%rax),%rdx
  401bcf:	48 8b 40 18          	mov    0x18(%rax),%rax
  401bd3:	48 8d 7c 24 34       	lea    0x34(%rsp),%rdi
  401bd8:	b9 0c 00 00 00       	mov    $0xc,%ecx
  401bdd:	48 8b 30             	mov    (%rax),%rsi
  401be0:	e8 2b f0 ff ff       	callq  400c10 <__memmove_chk@plt>
  401be5:	66 c1 cd 08          	ror    $0x8,%bp
  401be9:	66 89 6c 24 32       	mov    %bp,0x32(%rsp)
  401bee:	ba 10 00 00 00       	mov    $0x10,%edx
  401bf3:	48 8d 74 24 30       	lea    0x30(%rsp),%rsi
  401bf8:	44 89 e7             	mov    %r12d,%edi
  401bfb:	e8 90 f0 ff ff       	callq  400c90 <connect@plt>
  401c00:	85 c0                	test   %eax,%eax
  401c02:	79 5d                	jns    401c61 <submitr+0x1e6>
  401c04:	48 b8 45 72 72 6f 72 	movabs $0x55203a726f727245,%rax
  401c0b:	3a 20 55 
  401c0e:	49 89 07             	mov    %rax,(%r15)
  401c11:	48 b8 6e 61 62 6c 65 	movabs $0x6f7420656c62616e,%rax
  401c18:	20 74 6f 
  401c1b:	49 89 47 08          	mov    %rax,0x8(%r15)
  401c1f:	48 b8 20 63 6f 6e 6e 	movabs $0x7463656e6e6f6320,%rax
  401c26:	65 63 74 
  401c29:	49 89 47 10          	mov    %rax,0x10(%r15)
  401c2d:	48 b8 20 74 6f 20 74 	movabs $0x20656874206f7420,%rax
  401c34:	68 65 20 
  401c37:	49 89 47 18          	mov    %rax,0x18(%r15)
  401c3b:	41 c7 47 20 73 65 72 	movl   $0x76726573,0x20(%r15)
  401c42:	76 
  401c43:	66 41 c7 47 24 65 72 	movw   $0x7265,0x24(%r15)
  401c4a:	41 c6 47 26 00       	movb   $0x0,0x26(%r15)
  401c4f:	44 89 e7             	mov    %r12d,%edi
  401c52:	e8 59 ef ff ff       	callq  400bb0 <close@plt>
  401c57:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401c5c:	e9 e8 04 00 00       	jmpq   402149 <submitr+0x6ce>
  401c61:	49 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%r9
  401c68:	b8 00 00 00 00       	mov    $0x0,%eax
  401c6d:	4c 89 c9             	mov    %r9,%rcx
  401c70:	48 89 df             	mov    %rbx,%rdi
  401c73:	f2 ae                	repnz scas %es:(%rdi),%al
  401c75:	48 f7 d1             	not    %rcx
  401c78:	48 89 ce             	mov    %rcx,%rsi
  401c7b:	4c 89 c9             	mov    %r9,%rcx
  401c7e:	48 8b 3c 24          	mov    (%rsp),%rdi
  401c82:	f2 ae                	repnz scas %es:(%rdi),%al
  401c84:	49 89 c8             	mov    %rcx,%r8
  401c87:	4c 89 c9             	mov    %r9,%rcx
  401c8a:	48 8b 7c 24 08       	mov    0x8(%rsp),%rdi
  401c8f:	f2 ae                	repnz scas %es:(%rdi),%al
  401c91:	48 f7 d1             	not    %rcx
  401c94:	48 89 ca             	mov    %rcx,%rdx
  401c97:	4c 89 c9             	mov    %r9,%rcx
  401c9a:	48 8b 7c 24 10       	mov    0x10(%rsp),%rdi
  401c9f:	f2 ae                	repnz scas %es:(%rdi),%al
  401ca1:	4c 29 c2             	sub    %r8,%rdx
  401ca4:	48 29 ca             	sub    %rcx,%rdx
  401ca7:	48 8d 44 76 fd       	lea    -0x3(%rsi,%rsi,2),%rax
  401cac:	48 8d 44 02 7b       	lea    0x7b(%rdx,%rax,1),%rax
  401cb1:	48 3d 00 20 00 00    	cmp    $0x2000,%rax
  401cb7:	76 73                	jbe    401d2c <submitr+0x2b1>
  401cb9:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  401cc0:	3a 20 52 
  401cc3:	49 89 07             	mov    %rax,(%r15)
  401cc6:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  401ccd:	20 73 74 
  401cd0:	49 89 47 08          	mov    %rax,0x8(%r15)
  401cd4:	48 b8 72 69 6e 67 20 	movabs $0x6f6f7420676e6972,%rax
  401cdb:	74 6f 6f 
  401cde:	49 89 47 10          	mov    %rax,0x10(%r15)
  401ce2:	48 b8 20 6c 61 72 67 	movabs $0x202e656772616c20,%rax
  401ce9:	65 2e 20 
  401cec:	49 89 47 18          	mov    %rax,0x18(%r15)
  401cf0:	48 b8 49 6e 63 72 65 	movabs $0x6573616572636e49,%rax
  401cf7:	61 73 65 
  401cfa:	49 89 47 20          	mov    %rax,0x20(%r15)
  401cfe:	48 b8 20 53 55 42 4d 	movabs $0x5254494d42555320,%rax
  401d05:	49 54 52 
  401d08:	49 89 47 28          	mov    %rax,0x28(%r15)
  401d0c:	48 b8 5f 4d 41 58 42 	movabs $0x46554258414d5f,%rax
  401d13:	55 46 00 
  401d16:	49 89 47 30          	mov    %rax,0x30(%r15)
  401d1a:	44 89 e7             	mov    %r12d,%edi
  401d1d:	e8 8e ee ff ff       	callq  400bb0 <close@plt>
  401d22:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401d27:	e9 1d 04 00 00       	jmpq   402149 <submitr+0x6ce>
  401d2c:	48 8d 94 24 50 40 00 	lea    0x4050(%rsp),%rdx
  401d33:	00 
  401d34:	b9 00 04 00 00       	mov    $0x400,%ecx
  401d39:	b8 00 00 00 00       	mov    $0x0,%eax
  401d3e:	48 89 d7             	mov    %rdx,%rdi
  401d41:	f3 48 ab             	rep stos %rax,%es:(%rdi)
  401d44:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  401d4b:	48 89 df             	mov    %rbx,%rdi
  401d4e:	f2 ae                	repnz scas %es:(%rdi),%al
  401d50:	48 89 c8             	mov    %rcx,%rax
  401d53:	48 f7 d0             	not    %rax
  401d56:	48 83 e8 01          	sub    $0x1,%rax
  401d5a:	85 c0                	test   %eax,%eax
  401d5c:	0f 84 90 04 00 00    	je     4021f2 <submitr+0x777>
  401d62:	8d 40 ff             	lea    -0x1(%rax),%eax
  401d65:	4c 8d 74 03 01       	lea    0x1(%rbx,%rax,1),%r14
  401d6a:	48 89 d5             	mov    %rdx,%rbp
  401d6d:	49 bd d9 ff 00 00 00 	movabs $0x2000000000ffd9,%r13
  401d74:	00 20 00 
  401d77:	44 0f b6 03          	movzbl (%rbx),%r8d
  401d7b:	41 8d 40 d6          	lea    -0x2a(%r8),%eax
  401d7f:	3c 35                	cmp    $0x35,%al
  401d81:	77 06                	ja     401d89 <submitr+0x30e>
  401d83:	49 0f a3 c5          	bt     %rax,%r13
  401d87:	72 0d                	jb     401d96 <submitr+0x31b>
  401d89:	44 89 c0             	mov    %r8d,%eax
  401d8c:	83 e0 df             	and    $0xffffffdf,%eax
  401d8f:	83 e8 41             	sub    $0x41,%eax
  401d92:	3c 19                	cmp    $0x19,%al
  401d94:	77 0a                	ja     401da0 <submitr+0x325>
  401d96:	44 88 45 00          	mov    %r8b,0x0(%rbp)
  401d9a:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401d9e:	eb 6c                	jmp    401e0c <submitr+0x391>
  401da0:	41 80 f8 20          	cmp    $0x20,%r8b
  401da4:	75 0a                	jne    401db0 <submitr+0x335>
  401da6:	c6 45 00 2b          	movb   $0x2b,0x0(%rbp)
  401daa:	48 8d 6d 01          	lea    0x1(%rbp),%rbp
  401dae:	eb 5c                	jmp    401e0c <submitr+0x391>
  401db0:	41 8d 40 e0          	lea    -0x20(%r8),%eax
  401db4:	3c 5f                	cmp    $0x5f,%al
  401db6:	76 0a                	jbe    401dc2 <submitr+0x347>
  401db8:	41 80 f8 09          	cmp    $0x9,%r8b
  401dbc:	0f 85 a3 03 00 00    	jne    402165 <submitr+0x6ea>
  401dc2:	45 0f b6 c0          	movzbl %r8b,%r8d
  401dc6:	b9 40 2e 40 00       	mov    $0x402e40,%ecx
  401dcb:	ba 08 00 00 00       	mov    $0x8,%edx
  401dd0:	be 01 00 00 00       	mov    $0x1,%esi
  401dd5:	48 8d bc 24 50 80 00 	lea    0x8050(%rsp),%rdi
  401ddc:	00 
  401ddd:	b8 00 00 00 00       	mov    $0x0,%eax
  401de2:	e8 e9 ee ff ff       	callq  400cd0 <__sprintf_chk@plt>
  401de7:	0f b6 84 24 50 80 00 	movzbl 0x8050(%rsp),%eax
  401dee:	00 
  401def:	88 45 00             	mov    %al,0x0(%rbp)
  401df2:	0f b6 84 24 51 80 00 	movzbl 0x8051(%rsp),%eax
  401df9:	00 
  401dfa:	88 45 01             	mov    %al,0x1(%rbp)
  401dfd:	0f b6 84 24 52 80 00 	movzbl 0x8052(%rsp),%eax
  401e04:	00 
  401e05:	88 45 02             	mov    %al,0x2(%rbp)
  401e08:	48 8d 6d 03          	lea    0x3(%rbp),%rbp
  401e0c:	48 83 c3 01          	add    $0x1,%rbx
  401e10:	49 39 de             	cmp    %rbx,%r14
  401e13:	0f 85 5e ff ff ff    	jne    401d77 <submitr+0x2fc>
  401e19:	e9 d4 03 00 00       	jmpq   4021f2 <submitr+0x777>
  401e1e:	48 89 da             	mov    %rbx,%rdx
  401e21:	48 89 ee             	mov    %rbp,%rsi
  401e24:	44 89 e7             	mov    %r12d,%edi
  401e27:	e8 54 ed ff ff       	callq  400b80 <write@plt>
  401e2c:	48 85 c0             	test   %rax,%rax
  401e2f:	7f 0f                	jg     401e40 <submitr+0x3c5>
  401e31:	e8 1a ed ff ff       	callq  400b50 <__errno_location@plt>
  401e36:	83 38 04             	cmpl   $0x4,(%rax)
  401e39:	75 12                	jne    401e4d <submitr+0x3d2>
  401e3b:	b8 00 00 00 00       	mov    $0x0,%eax
  401e40:	48 01 c5             	add    %rax,%rbp
  401e43:	48 29 c3             	sub    %rax,%rbx
  401e46:	75 d6                	jne    401e1e <submitr+0x3a3>
  401e48:	4d 85 ed             	test   %r13,%r13
  401e4b:	79 5f                	jns    401eac <submitr+0x431>
  401e4d:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401e54:	3a 20 43 
  401e57:	49 89 07             	mov    %rax,(%r15)
  401e5a:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401e61:	20 75 6e 
  401e64:	49 89 47 08          	mov    %rax,0x8(%r15)
  401e68:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401e6f:	74 6f 20 
  401e72:	49 89 47 10          	mov    %rax,0x10(%r15)
  401e76:	48 b8 77 72 69 74 65 	movabs $0x6f74206574697277,%rax
  401e7d:	20 74 6f 
  401e80:	49 89 47 18          	mov    %rax,0x18(%r15)
  401e84:	48 b8 20 74 68 65 20 	movabs $0x7265732065687420,%rax
  401e8b:	73 65 72 
  401e8e:	49 89 47 20          	mov    %rax,0x20(%r15)
  401e92:	41 c7 47 28 76 65 72 	movl   $0x726576,0x28(%r15)
  401e99:	00 
  401e9a:	44 89 e7             	mov    %r12d,%edi
  401e9d:	e8 0e ed ff ff       	callq  400bb0 <close@plt>
  401ea2:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401ea7:	e9 9d 02 00 00       	jmpq   402149 <submitr+0x6ce>
  401eac:	44 89 64 24 40       	mov    %r12d,0x40(%rsp)
  401eb1:	c7 44 24 44 00 00 00 	movl   $0x0,0x44(%rsp)
  401eb8:	00 
  401eb9:	48 8d 44 24 50       	lea    0x50(%rsp),%rax
  401ebe:	48 89 44 24 48       	mov    %rax,0x48(%rsp)
  401ec3:	ba 00 20 00 00       	mov    $0x2000,%edx
  401ec8:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  401ecf:	00 
  401ed0:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401ed5:	e8 af fa ff ff       	callq  401989 <rio_readlineb>
  401eda:	48 85 c0             	test   %rax,%rax
  401edd:	7f 74                	jg     401f53 <submitr+0x4d8>
  401edf:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401ee6:	3a 20 43 
  401ee9:	49 89 07             	mov    %rax,(%r15)
  401eec:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ef3:	20 75 6e 
  401ef6:	49 89 47 08          	mov    %rax,0x8(%r15)
  401efa:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  401f01:	74 6f 20 
  401f04:	49 89 47 10          	mov    %rax,0x10(%r15)
  401f08:	48 b8 72 65 61 64 20 	movabs $0x7269662064616572,%rax
  401f0f:	66 69 72 
  401f12:	49 89 47 18          	mov    %rax,0x18(%r15)
  401f16:	48 b8 73 74 20 68 65 	movabs $0x6564616568207473,%rax
  401f1d:	61 64 65 
  401f20:	49 89 47 20          	mov    %rax,0x20(%r15)
  401f24:	48 b8 72 20 66 72 6f 	movabs $0x73206d6f72662072,%rax
  401f2b:	6d 20 73 
  401f2e:	49 89 47 28          	mov    %rax,0x28(%r15)
  401f32:	41 c7 47 30 65 72 76 	movl   $0x65767265,0x30(%r15)
  401f39:	65 
  401f3a:	66 41 c7 47 34 72 00 	movw   $0x72,0x34(%r15)
  401f41:	44 89 e7             	mov    %r12d,%edi
  401f44:	e8 67 ec ff ff       	callq  400bb0 <close@plt>
  401f49:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401f4e:	e9 f6 01 00 00       	jmpq   402149 <submitr+0x6ce>
  401f53:	4c 8d 84 24 50 80 00 	lea    0x8050(%rsp),%r8
  401f5a:	00 
  401f5b:	48 8d 4c 24 2c       	lea    0x2c(%rsp),%rcx
  401f60:	48 8d 94 24 50 60 00 	lea    0x6050(%rsp),%rdx
  401f67:	00 
  401f68:	be 47 2e 40 00       	mov    $0x402e47,%esi
  401f6d:	48 8d bc 24 50 20 00 	lea    0x2050(%rsp),%rdi
  401f74:	00 
  401f75:	b8 00 00 00 00       	mov    $0x0,%eax
  401f7a:	e8 c1 ec ff ff       	callq  400c40 <__isoc99_sscanf@plt>
  401f7f:	44 8b 44 24 2c       	mov    0x2c(%rsp),%r8d
  401f84:	41 81 f8 c8 00 00 00 	cmp    $0xc8,%r8d
  401f8b:	0f 84 be 00 00 00    	je     40204f <submitr+0x5d4>
  401f91:	4c 8d 8c 24 50 80 00 	lea    0x8050(%rsp),%r9
  401f98:	00 
  401f99:	b9 90 2d 40 00       	mov    $0x402d90,%ecx
  401f9e:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  401fa5:	be 01 00 00 00       	mov    $0x1,%esi
  401faa:	4c 89 ff             	mov    %r15,%rdi
  401fad:	b8 00 00 00 00       	mov    $0x0,%eax
  401fb2:	e8 19 ed ff ff       	callq  400cd0 <__sprintf_chk@plt>
  401fb7:	44 89 e7             	mov    %r12d,%edi
  401fba:	e8 f1 eb ff ff       	callq  400bb0 <close@plt>
  401fbf:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  401fc4:	e9 80 01 00 00       	jmpq   402149 <submitr+0x6ce>
  401fc9:	ba 00 20 00 00       	mov    $0x2000,%edx
  401fce:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  401fd5:	00 
  401fd6:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  401fdb:	e8 a9 f9 ff ff       	callq  401989 <rio_readlineb>
  401fe0:	48 85 c0             	test   %rax,%rax
  401fe3:	7f 6a                	jg     40204f <submitr+0x5d4>
  401fe5:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  401fec:	3a 20 43 
  401fef:	49 89 07             	mov    %rax,(%r15)
  401ff2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  401ff9:	20 75 6e 
  401ffc:	49 89 47 08          	mov    %rax,0x8(%r15)
  402000:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  402007:	74 6f 20 
  40200a:	49 89 47 10          	mov    %rax,0x10(%r15)
  40200e:	48 b8 72 65 61 64 20 	movabs $0x6165682064616572,%rax
  402015:	68 65 61 
  402018:	49 89 47 18          	mov    %rax,0x18(%r15)
  40201c:	48 b8 64 65 72 73 20 	movabs $0x6f72662073726564,%rax
  402023:	66 72 6f 
  402026:	49 89 47 20          	mov    %rax,0x20(%r15)
  40202a:	48 b8 6d 20 73 65 72 	movabs $0x726576726573206d,%rax
  402031:	76 65 72 
  402034:	49 89 47 28          	mov    %rax,0x28(%r15)
  402038:	41 c6 47 30 00       	movb   $0x0,0x30(%r15)
  40203d:	44 89 e7             	mov    %r12d,%edi
  402040:	e8 6b eb ff ff       	callq  400bb0 <close@plt>
  402045:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40204a:	e9 fa 00 00 00       	jmpq   402149 <submitr+0x6ce>
  40204f:	80 bc 24 50 20 00 00 	cmpb   $0xd,0x2050(%rsp)
  402056:	0d 
  402057:	0f 85 6c ff ff ff    	jne    401fc9 <submitr+0x54e>
  40205d:	80 bc 24 51 20 00 00 	cmpb   $0xa,0x2051(%rsp)
  402064:	0a 
  402065:	0f 85 5e ff ff ff    	jne    401fc9 <submitr+0x54e>
  40206b:	80 bc 24 52 20 00 00 	cmpb   $0x0,0x2052(%rsp)
  402072:	00 
  402073:	0f 85 50 ff ff ff    	jne    401fc9 <submitr+0x54e>
  402079:	ba 00 20 00 00       	mov    $0x2000,%edx
  40207e:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  402085:	00 
  402086:	48 8d 7c 24 40       	lea    0x40(%rsp),%rdi
  40208b:	e8 f9 f8 ff ff       	callq  401989 <rio_readlineb>
  402090:	48 85 c0             	test   %rax,%rax
  402093:	7f 70                	jg     402105 <submitr+0x68a>
  402095:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  40209c:	3a 20 43 
  40209f:	49 89 07             	mov    %rax,(%r15)
  4020a2:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  4020a9:	20 75 6e 
  4020ac:	49 89 47 08          	mov    %rax,0x8(%r15)
  4020b0:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  4020b7:	74 6f 20 
  4020ba:	49 89 47 10          	mov    %rax,0x10(%r15)
  4020be:	48 b8 72 65 61 64 20 	movabs $0x6174732064616572,%rax
  4020c5:	73 74 61 
  4020c8:	49 89 47 18          	mov    %rax,0x18(%r15)
  4020cc:	48 b8 74 75 73 20 6d 	movabs $0x7373656d20737574,%rax
  4020d3:	65 73 73 
  4020d6:	49 89 47 20          	mov    %rax,0x20(%r15)
  4020da:	48 b8 61 67 65 20 66 	movabs $0x6d6f726620656761,%rax
  4020e1:	72 6f 6d 
  4020e4:	49 89 47 28          	mov    %rax,0x28(%r15)
  4020e8:	48 b8 20 73 65 72 76 	movabs $0x72657672657320,%rax
  4020ef:	65 72 00 
  4020f2:	49 89 47 30          	mov    %rax,0x30(%r15)
  4020f6:	44 89 e7             	mov    %r12d,%edi
  4020f9:	e8 b2 ea ff ff       	callq  400bb0 <close@plt>
  4020fe:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402103:	eb 44                	jmp    402149 <submitr+0x6ce>
  402105:	48 8d b4 24 50 20 00 	lea    0x2050(%rsp),%rsi
  40210c:	00 
  40210d:	4c 89 ff             	mov    %r15,%rdi
  402110:	e8 4b ea ff ff       	callq  400b60 <strcpy@plt>
  402115:	44 89 e7             	mov    %r12d,%edi
  402118:	e8 93 ea ff ff       	callq  400bb0 <close@plt>
  40211d:	41 0f b6 17          	movzbl (%r15),%edx
  402121:	b8 4f 00 00 00       	mov    $0x4f,%eax
  402126:	29 d0                	sub    %edx,%eax
  402128:	75 15                	jne    40213f <submitr+0x6c4>
  40212a:	41 0f b6 57 01       	movzbl 0x1(%r15),%edx
  40212f:	b8 4b 00 00 00       	mov    $0x4b,%eax
  402134:	29 d0                	sub    %edx,%eax
  402136:	75 07                	jne    40213f <submitr+0x6c4>
  402138:	41 0f b6 47 02       	movzbl 0x2(%r15),%eax
  40213d:	f7 d8                	neg    %eax
  40213f:	85 c0                	test   %eax,%eax
  402141:	0f 95 c0             	setne  %al
  402144:	0f b6 c0             	movzbl %al,%eax
  402147:	f7 d8                	neg    %eax
  402149:	48 8b 8c 24 58 a0 00 	mov    0xa058(%rsp),%rcx
  402150:	00 
  402151:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402158:	00 00 
  40215a:	0f 84 12 01 00 00    	je     402272 <submitr+0x7f7>
  402160:	e9 08 01 00 00       	jmpq   40226d <submitr+0x7f2>
  402165:	48 b8 45 72 72 6f 72 	movabs $0x52203a726f727245,%rax
  40216c:	3a 20 52 
  40216f:	49 89 07             	mov    %rax,(%r15)
  402172:	48 b8 65 73 75 6c 74 	movabs $0x747320746c757365,%rax
  402179:	20 73 74 
  40217c:	49 89 47 08          	mov    %rax,0x8(%r15)
  402180:	48 b8 72 69 6e 67 20 	movabs $0x6e6f6320676e6972,%rax
  402187:	63 6f 6e 
  40218a:	49 89 47 10          	mov    %rax,0x10(%r15)
  40218e:	48 b8 74 61 69 6e 73 	movabs $0x6e6120736e696174,%rax
  402195:	20 61 6e 
  402198:	49 89 47 18          	mov    %rax,0x18(%r15)
  40219c:	48 b8 20 69 6c 6c 65 	movabs $0x6c6167656c6c6920,%rax
  4021a3:	67 61 6c 
  4021a6:	49 89 47 20          	mov    %rax,0x20(%r15)
  4021aa:	48 b8 20 6f 72 20 75 	movabs $0x72706e7520726f20,%rax
  4021b1:	6e 70 72 
  4021b4:	49 89 47 28          	mov    %rax,0x28(%r15)
  4021b8:	48 b8 69 6e 74 61 62 	movabs $0x20656c6261746e69,%rax
  4021bf:	6c 65 20 
  4021c2:	49 89 47 30          	mov    %rax,0x30(%r15)
  4021c6:	48 b8 63 68 61 72 61 	movabs $0x6574636172616863,%rax
  4021cd:	63 74 65 
  4021d0:	49 89 47 38          	mov    %rax,0x38(%r15)
  4021d4:	66 41 c7 47 40 72 2e 	movw   $0x2e72,0x40(%r15)
  4021db:	41 c6 47 42 00       	movb   $0x0,0x42(%r15)
  4021e0:	44 89 e7             	mov    %r12d,%edi
  4021e3:	e8 c8 e9 ff ff       	callq  400bb0 <close@plt>
  4021e8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4021ed:	e9 57 ff ff ff       	jmpq   402149 <submitr+0x6ce>
  4021f2:	48 8d 9c 24 50 20 00 	lea    0x2050(%rsp),%rbx
  4021f9:	00 
  4021fa:	48 83 ec 08          	sub    $0x8,%rsp
  4021fe:	48 8d 84 24 58 40 00 	lea    0x4058(%rsp),%rax
  402205:	00 
  402206:	50                   	push   %rax
  402207:	ff 74 24 20          	pushq  0x20(%rsp)
  40220b:	ff 74 24 30          	pushq  0x30(%rsp)
  40220f:	4c 8b 4c 24 28       	mov    0x28(%rsp),%r9
  402214:	4c 8b 44 24 20       	mov    0x20(%rsp),%r8
  402219:	b9 c0 2d 40 00       	mov    $0x402dc0,%ecx
  40221e:	ba 00 20 00 00       	mov    $0x2000,%edx
  402223:	be 01 00 00 00       	mov    $0x1,%esi
  402228:	48 89 df             	mov    %rbx,%rdi
  40222b:	b8 00 00 00 00       	mov    $0x0,%eax
  402230:	e8 9b ea ff ff       	callq  400cd0 <__sprintf_chk@plt>
  402235:	b8 00 00 00 00       	mov    $0x0,%eax
  40223a:	48 c7 c1 ff ff ff ff 	mov    $0xffffffffffffffff,%rcx
  402241:	48 89 df             	mov    %rbx,%rdi
  402244:	f2 ae                	repnz scas %es:(%rdi),%al
  402246:	48 89 c8             	mov    %rcx,%rax
  402249:	48 f7 d0             	not    %rax
  40224c:	4c 8d 68 ff          	lea    -0x1(%rax),%r13
  402250:	48 83 c4 20          	add    $0x20,%rsp
  402254:	4c 89 eb             	mov    %r13,%rbx
  402257:	48 8d ac 24 50 20 00 	lea    0x2050(%rsp),%rbp
  40225e:	00 
  40225f:	4d 85 ed             	test   %r13,%r13
  402262:	0f 85 b6 fb ff ff    	jne    401e1e <submitr+0x3a3>
  402268:	e9 3f fc ff ff       	jmpq   401eac <submitr+0x431>
  40226d:	e8 1e e9 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  402272:	48 81 c4 68 a0 00 00 	add    $0xa068,%rsp
  402279:	5b                   	pop    %rbx
  40227a:	5d                   	pop    %rbp
  40227b:	41 5c                	pop    %r12
  40227d:	41 5d                	pop    %r13
  40227f:	41 5e                	pop    %r14
  402281:	41 5f                	pop    %r15
  402283:	c3                   	retq   

0000000000402284 <init_timeout>:
  402284:	85 ff                	test   %edi,%edi
  402286:	74 22                	je     4022aa <init_timeout+0x26>
  402288:	53                   	push   %rbx
  402289:	89 fb                	mov    %edi,%ebx
  40228b:	be 5b 19 40 00       	mov    $0x40195b,%esi
  402290:	bf 0e 00 00 00       	mov    $0xe,%edi
  402295:	e8 56 e9 ff ff       	callq  400bf0 <signal@plt>
  40229a:	85 db                	test   %ebx,%ebx
  40229c:	bf 00 00 00 00       	mov    $0x0,%edi
  4022a1:	0f 49 fb             	cmovns %ebx,%edi
  4022a4:	e8 f7 e8 ff ff       	callq  400ba0 <alarm@plt>
  4022a9:	5b                   	pop    %rbx
  4022aa:	f3 c3                	repz retq 

00000000004022ac <init_driver>:
  4022ac:	55                   	push   %rbp
  4022ad:	53                   	push   %rbx
  4022ae:	48 83 ec 28          	sub    $0x28,%rsp
  4022b2:	48 89 fd             	mov    %rdi,%rbp
  4022b5:	64 48 8b 04 25 28 00 	mov    %fs:0x28,%rax
  4022bc:	00 00 
  4022be:	48 89 44 24 18       	mov    %rax,0x18(%rsp)
  4022c3:	31 c0                	xor    %eax,%eax
  4022c5:	be 01 00 00 00       	mov    $0x1,%esi
  4022ca:	bf 0d 00 00 00       	mov    $0xd,%edi
  4022cf:	e8 1c e9 ff ff       	callq  400bf0 <signal@plt>
  4022d4:	be 01 00 00 00       	mov    $0x1,%esi
  4022d9:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4022de:	e8 0d e9 ff ff       	callq  400bf0 <signal@plt>
  4022e3:	be 01 00 00 00       	mov    $0x1,%esi
  4022e8:	bf 1d 00 00 00       	mov    $0x1d,%edi
  4022ed:	e8 fe e8 ff ff       	callq  400bf0 <signal@plt>
  4022f2:	ba 00 00 00 00       	mov    $0x0,%edx
  4022f7:	be 01 00 00 00       	mov    $0x1,%esi
  4022fc:	bf 02 00 00 00       	mov    $0x2,%edi
  402301:	e8 da e9 ff ff       	callq  400ce0 <socket@plt>
  402306:	85 c0                	test   %eax,%eax
  402308:	79 4f                	jns    402359 <init_driver+0xad>
  40230a:	48 b8 45 72 72 6f 72 	movabs $0x43203a726f727245,%rax
  402311:	3a 20 43 
  402314:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402318:	48 b8 6c 69 65 6e 74 	movabs $0x6e7520746e65696c,%rax
  40231f:	20 75 6e 
  402322:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402326:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40232d:	74 6f 20 
  402330:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402334:	48 b8 63 72 65 61 74 	movabs $0x7320657461657263,%rax
  40233b:	65 20 73 
  40233e:	48 89 45 18          	mov    %rax,0x18(%rbp)
  402342:	c7 45 20 6f 63 6b 65 	movl   $0x656b636f,0x20(%rbp)
  402349:	66 c7 45 24 74 00    	movw   $0x74,0x24(%rbp)
  40234f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  402354:	e9 0c 01 00 00       	jmpq   402465 <init_driver+0x1b9>
  402359:	89 c3                	mov    %eax,%ebx
  40235b:	bf 58 2e 40 00       	mov    $0x402e58,%edi
  402360:	e8 9b e8 ff ff       	callq  400c00 <gethostbyname@plt>
  402365:	48 85 c0             	test   %rax,%rax
  402368:	75 68                	jne    4023d2 <init_driver+0x126>
  40236a:	48 b8 45 72 72 6f 72 	movabs $0x44203a726f727245,%rax
  402371:	3a 20 44 
  402374:	48 89 45 00          	mov    %rax,0x0(%rbp)
  402378:	48 b8 4e 53 20 69 73 	movabs $0x6e7520736920534e,%rax
  40237f:	20 75 6e 
  402382:	48 89 45 08          	mov    %rax,0x8(%rbp)
  402386:	48 b8 61 62 6c 65 20 	movabs $0x206f7420656c6261,%rax
  40238d:	74 6f 20 
  402390:	48 89 45 10          	mov    %rax,0x10(%rbp)
  402394:	48 b8 72 65 73 6f 6c 	movabs $0x2065766c6f736572,%rax
  40239b:	76 65 20 
  40239e:	48 89 45 18          	mov    %rax,0x18(%rbp)
  4023a2:	48 b8 73 65 72 76 65 	movabs $0x6120726576726573,%rax
  4023a9:	72 20 61 
  4023ac:	48 89 45 20          	mov    %rax,0x20(%rbp)
  4023b0:	c7 45 28 64 64 72 65 	movl   $0x65726464,0x28(%rbp)
  4023b7:	66 c7 45 2c 73 73    	movw   $0x7373,0x2c(%rbp)
  4023bd:	c6 45 2e 00          	movb   $0x0,0x2e(%rbp)
  4023c1:	89 df                	mov    %ebx,%edi
  4023c3:	e8 e8 e7 ff ff       	callq  400bb0 <close@plt>
  4023c8:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  4023cd:	e9 93 00 00 00       	jmpq   402465 <init_driver+0x1b9>
  4023d2:	48 c7 04 24 00 00 00 	movq   $0x0,(%rsp)
  4023d9:	00 
  4023da:	48 c7 44 24 08 00 00 	movq   $0x0,0x8(%rsp)
  4023e1:	00 00 
  4023e3:	66 c7 04 24 02 00    	movw   $0x2,(%rsp)
  4023e9:	48 63 50 14          	movslq 0x14(%rax),%rdx
  4023ed:	48 8b 40 18          	mov    0x18(%rax),%rax
  4023f1:	48 8d 7c 24 04       	lea    0x4(%rsp),%rdi
  4023f6:	b9 0c 00 00 00       	mov    $0xc,%ecx
  4023fb:	48 8b 30             	mov    (%rax),%rsi
  4023fe:	e8 0d e8 ff ff       	callq  400c10 <__memmove_chk@plt>
  402403:	66 c7 44 24 02 07 e6 	movw   $0xe607,0x2(%rsp)
  40240a:	ba 10 00 00 00       	mov    $0x10,%edx
  40240f:	48 89 e6             	mov    %rsp,%rsi
  402412:	89 df                	mov    %ebx,%edi
  402414:	e8 77 e8 ff ff       	callq  400c90 <connect@plt>
  402419:	85 c0                	test   %eax,%eax
  40241b:	79 32                	jns    40244f <init_driver+0x1a3>
  40241d:	41 b8 58 2e 40 00    	mov    $0x402e58,%r8d
  402423:	b9 18 2e 40 00       	mov    $0x402e18,%ecx
  402428:	48 c7 c2 ff ff ff ff 	mov    $0xffffffffffffffff,%rdx
  40242f:	be 01 00 00 00       	mov    $0x1,%esi
  402434:	48 89 ef             	mov    %rbp,%rdi
  402437:	b8 00 00 00 00       	mov    $0x0,%eax
  40243c:	e8 8f e8 ff ff       	callq  400cd0 <__sprintf_chk@plt>
  402441:	89 df                	mov    %ebx,%edi
  402443:	e8 68 e7 ff ff       	callq  400bb0 <close@plt>
  402448:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  40244d:	eb 16                	jmp    402465 <init_driver+0x1b9>
  40244f:	89 df                	mov    %ebx,%edi
  402451:	e8 5a e7 ff ff       	callq  400bb0 <close@plt>
  402456:	66 c7 45 00 4f 4b    	movw   $0x4b4f,0x0(%rbp)
  40245c:	c6 45 02 00          	movb   $0x0,0x2(%rbp)
  402460:	b8 00 00 00 00       	mov    $0x0,%eax
  402465:	48 8b 4c 24 18       	mov    0x18(%rsp),%rcx
  40246a:	64 48 33 0c 25 28 00 	xor    %fs:0x28,%rcx
  402471:	00 00 
  402473:	74 05                	je     40247a <init_driver+0x1ce>
  402475:	e8 16 e7 ff ff       	callq  400b90 <__stack_chk_fail@plt>
  40247a:	48 83 c4 28          	add    $0x28,%rsp
  40247e:	5b                   	pop    %rbx
  40247f:	5d                   	pop    %rbp
  402480:	c3                   	retq   

0000000000402481 <driver_post>:
  402481:	53                   	push   %rbx
  402482:	4c 89 c3             	mov    %r8,%rbx
  402485:	85 c9                	test   %ecx,%ecx
  402487:	74 24                	je     4024ad <driver_post+0x2c>
  402489:	be 6f 2e 40 00       	mov    $0x402e6f,%esi
  40248e:	bf 01 00 00 00       	mov    $0x1,%edi
  402493:	b8 00 00 00 00       	mov    $0x0,%eax
  402498:	e8 b3 e7 ff ff       	callq  400c50 <__printf_chk@plt>
  40249d:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4024a2:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4024a6:	b8 00 00 00 00       	mov    $0x0,%eax
  4024ab:	eb 41                	jmp    4024ee <driver_post+0x6d>
  4024ad:	48 85 ff             	test   %rdi,%rdi
  4024b0:	74 2e                	je     4024e0 <driver_post+0x5f>
  4024b2:	80 3f 00             	cmpb   $0x0,(%rdi)
  4024b5:	74 29                	je     4024e0 <driver_post+0x5f>
  4024b7:	41 50                	push   %r8
  4024b9:	52                   	push   %rdx
  4024ba:	41 b9 86 2e 40 00    	mov    $0x402e86,%r9d
  4024c0:	49 89 f0             	mov    %rsi,%r8
  4024c3:	48 89 f9             	mov    %rdi,%rcx
  4024c6:	ba 8a 2e 40 00       	mov    $0x402e8a,%edx
  4024cb:	be e6 07 00 00       	mov    $0x7e6,%esi
  4024d0:	bf 58 2e 40 00       	mov    $0x402e58,%edi
  4024d5:	e8 a1 f5 ff ff       	callq  401a7b <submitr>
  4024da:	48 83 c4 10          	add    $0x10,%rsp
  4024de:	eb 0e                	jmp    4024ee <driver_post+0x6d>
  4024e0:	66 c7 03 4f 4b       	movw   $0x4b4f,(%rbx)
  4024e5:	c6 43 02 00          	movb   $0x0,0x2(%rbx)
  4024e9:	b8 00 00 00 00       	mov    $0x0,%eax
  4024ee:	5b                   	pop    %rbx
  4024ef:	c3                   	retq   

00000000004024f0 <__libc_csu_init>:
  4024f0:	41 57                	push   %r15
  4024f2:	41 56                	push   %r14
  4024f4:	41 89 ff             	mov    %edi,%r15d
  4024f7:	41 55                	push   %r13
  4024f9:	41 54                	push   %r12
  4024fb:	4c 8d 25 0e 19 20 00 	lea    0x20190e(%rip),%r12        # 603e10 <__frame_dummy_init_array_entry>
  402502:	55                   	push   %rbp
  402503:	48 8d 2d 0e 19 20 00 	lea    0x20190e(%rip),%rbp        # 603e18 <__init_array_end>
  40250a:	53                   	push   %rbx
  40250b:	49 89 f6             	mov    %rsi,%r14
  40250e:	49 89 d5             	mov    %rdx,%r13
  402511:	4c 29 e5             	sub    %r12,%rbp
  402514:	48 83 ec 08          	sub    $0x8,%rsp
  402518:	48 c1 fd 03          	sar    $0x3,%rbp
  40251c:	e8 df e5 ff ff       	callq  400b00 <_init>
  402521:	48 85 ed             	test   %rbp,%rbp
  402524:	74 20                	je     402546 <__libc_csu_init+0x56>
  402526:	31 db                	xor    %ebx,%ebx
  402528:	0f 1f 84 00 00 00 00 	nopl   0x0(%rax,%rax,1)
  40252f:	00 
  402530:	4c 89 ea             	mov    %r13,%rdx
  402533:	4c 89 f6             	mov    %r14,%rsi
  402536:	44 89 ff             	mov    %r15d,%edi
  402539:	41 ff 14 dc          	callq  *(%r12,%rbx,8)
  40253d:	48 83 c3 01          	add    $0x1,%rbx
  402541:	48 39 eb             	cmp    %rbp,%rbx
  402544:	75 ea                	jne    402530 <__libc_csu_init+0x40>
  402546:	48 83 c4 08          	add    $0x8,%rsp
  40254a:	5b                   	pop    %rbx
  40254b:	5d                   	pop    %rbp
  40254c:	41 5c                	pop    %r12
  40254e:	41 5d                	pop    %r13
  402550:	41 5e                	pop    %r14
  402552:	41 5f                	pop    %r15
  402554:	c3                   	retq   
  402555:	90                   	nop
  402556:	66 2e 0f 1f 84 00 00 	nopw   %cs:0x0(%rax,%rax,1)
  40255d:	00 00 00 

0000000000402560 <__libc_csu_fini>:
  402560:	f3 c3                	repz retq 

Disassembly of section .fini:

0000000000402564 <_fini>:
  402564:	48 83 ec 08          	sub    $0x8,%rsp
  402568:	48 83 c4 08          	add    $0x8,%rsp
  40256c:	c3                   	retq   
