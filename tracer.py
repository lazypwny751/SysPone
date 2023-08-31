from bcc import BPF

# Burada öncelikle gözlemlediğimiz sistem çağrılarının oarametrelerini
# getirip bakacağız ve burada en çok göze çarğanı alıp twitter bota göndereceğiz

prog = """
int hello(void *ctx) {
	bpf_trace_printk("Mrb\\n");
	return 0;
}
"""

b = BPF(text=prog)
b.attach_kprobe(event=iov.get_syscall_fnname("clone"), fn_name="hello")
b.trace_print()
