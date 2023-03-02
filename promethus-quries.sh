up{instance="shipping.roboshop.internal:9100", job="shipping"}

avg(rate(node_cpu_seconds_total{mode="idle"}[1m]))

sum by(mode)(irate(node_cpu_seconds_total{mode="user"}[5m]))




Dashboard: 
irate(node_cpu_seconds_total{mode="user"}[5m])
irate(node_memory_Active_bytes[30s])


irate(node_network_transmit_bytes_total{device="eth0"}[30s])+irate(node_network_receive_bytes_total{device="eth0"}[30s])

