<div align="center">

# 🌐 Experiment 1 — Network Devices & LAN Setup

### Repeater • Hub • Switch • Bridge • Router • Gateway • Internet Connection Sharing

[![Networking](https://img.shields.io/badge/Topic-Network%20Devices-3776AB?style=for-the-badge&logo=cisco&logoColor=white)](#)
[![Computer Networks Lab](https://img.shields.io/badge/Computer%20Networks-Lab-00F7FF?style=for-the-badge&logo=cachet&logoColor=white)](#)
[![OSI Layers](https://img.shields.io/badge/OSI-Layers%201--3-2C5364?style=for-the-badge&logo=OSI&logoColor=white)](#)
[![Status](https://img.shields.io/badge/Status-Completed-0D1117?style=for-the-badge&logo=checkmarx&logoColor=00F7FF)](#)

</div>

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 🎯 Aim

1. Study of Network devices in detail.
2. Connect the computers in a Local Area Network (LAN) and share the Internet connection from the host computer with client computers.

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 📝 Description

## 🧩 Part A — Study of Network Devices

Networking hardware can be organized by **which OSI layer it operates at** and **how "intelligently" it forwards traffic** — from a device that simply amplifies a signal, all the way up to one that can translate between entirely different protocols.

```mermaid
flowchart LR
    subgraph L1["Physical Layer (L1)"]
        REP[Repeater]
        HUB[Hub]
    end
    subgraph L2["Data Link Layer (L2)"]
        SW[Switch]
        BR[Bridge]
    end
    subgraph L3["Network Layer (L3)"]
        RT[Router]
    end
    subgraph LX["Multi-Layer / Protocol Translation"]
        GW[Gateway]
    end

    REP --> HUB --> SW --> RT --> GW
    BR -.same layer as.- SW
```

### 📡 1. Repeater

A repeater receives a **weak signal**, regenerates it at higher power, and retransmits it to extend the communication distance. It has **two ports** and simply connects two network segments — it does not interpret or filter any data.

```mermaid
flowchart LR
    A["Strong Signal"] --> B["Weak Signal (attenuated over distance)"]
    B --> C(["📶 Repeater<br/>regenerates signal"])
    C --> D["Strong Signal"]
```

### 🔌 2. Hub

An **Ethernet Hub** is a multiport repeater that connects multiple Ethernet devices into a single network segment.

| Property | Detail |
|----------|--------|
| OSI Layer | Physical Layer (Layer 1) |
| Behavior | Receives and regenerates signals, then **broadcasts** them to *all* connected ports |
| Collisions | On collision, sends a **jam signal** to all devices, which then retransmit after a random backoff period |

```mermaid
flowchart TD
    PC1[PC 1] --> HUB(("🔌 Hub"))
    PC2[PC 2] --> HUB
    PC3[PC 3] --> HUB
    HUB --> PC1
    HUB --> PC2
    HUB --> PC3
    style HUB fill:#2C5364,color:#fff
```

### 🔀 3. Switch

A **network switch** connects multiple devices or network segments and mainly operates at the **Data Link Layer (Layer 2)**.

- Examines the **destination MAC address** of each incoming frame.
- Forwards the frame **only to the appropriate port** (instead of broadcasting), reducing unnecessary traffic and improving efficiency.
- **Layer 3 switches** can additionally perform routing functions for larger networks.

```mermaid
flowchart LR
    PC1[Laptop] --> SW(("🔀 Switch"))
    PC2[Laptop] --> SW
    PC3[Laptop] --> SW
    SW --> RT(["Router"])
    RT --> NET(("🌐 Internet"))
```

### 🌉 4. Bridge

A **network bridge** connects multiple network segments and also operates at the **Data Link Layer (Layer 2)**. It examines incoming frames and forwards or filters them based on MAC addresses, reducing unnecessary traffic.

> A switch is essentially a **multiport bridge** — the two terms are often used interchangeably.

```mermaid
flowchart LR
    subgraph SEG1["Segment 1 (10.0.0.0/8)"]
        S1[Server] --- P1[PC1] & P2[PC2] & P3[PC3]
    end
    subgraph SEG2["Segment 2 (20.0.0.0/8)"]
        S2[Server] --- P4[PC1] & P5[PC2] & P6[PC3]
    end
    SEG1 <--> BRIDGE(("🌉 Bridge")) <--> SEG2
```

### 🧭 5. Router

A **router** connects two or more networks and operates at the **Network Layer (Layer 3)**. It examines the **destination IP address** of packets and forwards them along the best path, using **routing tables** to make that decision.

```mermaid
flowchart LR
    subgraph NET1["Network 1"]
        HUBX(("Hub")) --- PC1[PC] & PC2[PC] & PC3[PC]
    end
    subgraph NET2["Network 2"]
        SWX(("Switch")) --- PC4[PC] & PC5[PC] & PC6[PC]
    end
    NET1 <--> RTX(("🧭 Router<br/>uses routing table")) <--> NET2
```

### 🚪 6. Gateway

A **gateway** connects two or more networks that use **different communication protocols** and enables them to communicate by performing **protocol conversion**. It ensures interoperability between dissimilar networks and may include protocol translators, rate converters, or signal translators.

```mermaid
flowchart LR
    subgraph N1["Network 1 (Protocol A)"]
        R1(("Router")) --- C1[Client] & C2[Client]
    end
    subgraph N2["Network 2 (Protocol B)"]
        C3[Client] & C4[Client]
    end
    R1 --> GW(("🚪 Gateway<br/>protocol conversion")) --> N2
```

## 🔑 Device Comparison

| Device | OSI Layer | Forwarding Decision | Ports |
|--------|-----------|----------------------|-------|
| **Repeater** | Physical (L1) | None — regenerates signal only | 2 |
| **Hub** | Physical (L1) | None — broadcasts to all ports | Multiple |
| **Switch** | Data Link (L2) | Destination MAC address | Multiple |
| **Bridge** | Data Link (L2) | Destination MAC address | 2 (segments) |
| **Router** | Network (L3) | Destination IP address (routing table) | Multiple networks |
| **Gateway** | Multi-layer | Protocol translation | Dissimilar networks |

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

## 🖧 Part B — Connecting Computers in a LAN & Sharing the Internet

**Aim of this part:** connect computers in a Local Area Network (LAN) and share the Internet connection from the **host computer** with **client computers**, using **Internet Connection Sharing (ICS)**.

```mermaid
sequenceDiagram
    participant Internet
    participant Host as Host Computer
    participant Client as Client Computer(s)

    Internet->>Host: Internet connection (dial-up / broadband)
    Note over Host: Enable Internet Connection Sharing (ICS)
    Host->>Host: LAN adapter auto-assigned<br/>IP 192.168.0.1 / Subnet 255.255.255.0
    Host->>Client: Shares Internet over LAN
    Client->>Client: Set to "Obtain an IP address automatically"
    Client->>Host: Requests IP via DHCP
    Host-->>Client: Assigns IP address
    Client->>Internet: Accesses Internet through shared connection
```

**📋 Click to view the Host-Computer Setup Procedure (Enable ICS)**

<details>
<summary>Steps on the Host Computer</summary>

1. Log on to the host computer as an **Administrator** or **Owner**.
2. Click **Start**, then click **Control Panel**.
3. Click **Network and Internet Connections**.
4. Click **Network Connections**.
5. Right-click the Internet connection to share (dial-up, broadband, or other network connection), then click **Properties**.
6. Click the **Advanced** tab.
7. Under **Internet Connection Sharing**, select **Allow other network users to connect through this computer's Internet connection**.
8. If sharing a dial-up connection, optionally select **Establish a dial-up connection whenever a computer on my network attempts to access the Internet**.
9. Click **OK**.

A confirmation message appears, warning that:

> When Internet Connection Sharing is enabled, your LAN adapter will be set to use the IP address `192.168.0.1`. Your computer may lose connectivity with other computers on your network. If these other computers have static IP addresses, it is a good idea to set them to obtain their IP addresses automatically. Are you sure you want to enable Internet Connection Sharing?

10. Click **Yes**.

Once enabled, the Internet connection is shared with all other computers on the LAN. The host's LAN adapter is automatically assigned:

| Setting | Value |
|---------|-------|
| **IP Address** | `192.168.0.1` |
| **Subnet Mask** | `255.255.255.0` |

</details>

**📋 Click to view the Client-Computer Setup Procedure**

<details>
<summary>Steps on the Client Computer</summary>

1. Ensure the LAN adapter is connected to the host computer.
2. Open **Control Panel → Network and Internet Connections → Network Connections**.
3. Right-click **Local Area Connection** and select **Properties**.
4. Select **Internet Protocol (TCP/IP)** or **Internet Protocol Version 4 (TCP/IPv4)**, then click **Properties**.
5. Select **Obtain an IP address automatically**.
6. Select **Obtain DNS server address automatically**.
7. Click **OK**, and close all dialog boxes.
8. Restart the computer if prompted.

</details>

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

# 📤 Output

> ℹ️ **Note:** This experiment is a hardware/OS-configuration study rather than a program — there is no source code and no console/program output in the PDF. The PDF instead states the practical result of following the procedure, reproduced below.

Once the setup is complete:

- The **host computer's** LAN adapter is automatically configured with **IP Address `192.168.0.1`** and **Subnet Mask `255.255.255.0`**.
- The **client computer** automatically receives an IP address from the host computer (via DHCP, once set to "Obtain an IP address automatically").
- The client computer is then able to **access the Internet through the shared connection**, confirming that the LAN has been successfully set up with Internet Connection Sharing.

[![](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)](https://raw.githubusercontent.com/andreasbm/readme/master/assets/lines/rainbow.gif)

<div align="center">

### Made with ❤️ by **Thrinath**
📂 Part of the [`Sector5_Labs`](https://github.com/thrinathpolanki/Sector5_Labs) — Computer Networks Lab

</div>
