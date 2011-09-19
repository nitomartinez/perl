/* perl_android_getprotobynameandnumber.c
 *
 * Implements static entries of getprotobyname and getprotobynumber into iperlsys.h
 * A bit of brute force to get this working...
 *
 *    Copyright (C) 2011 by Nito at Qindel dot ES
 *
 *    You may distribute under the terms of either the GNU General Public
 *    License or the Artistic License, as specified in the README file.
 *
 */
#include <stdio.h>
#include "android.h"

struct protoent staticprotoentsp[] = {
  { "manet", (char *[]) { NULL},  138 },
  { "ip", (char *[]) { "IP", NULL},  0 },
  { "icmp", (char *[]) { "ICMP", NULL},  1 },
  { "igmp", (char *[]) { "IGMP", NULL},  2 },
  { "ggp", (char *[]) { "GGP", NULL},  3 },
  { "ipencap", (char *[]) { "IP-ENCAP", NULL},  4 },
  { "st", (char *[]) { "ST", NULL},  5 },
  { "tcp", (char *[]) { "TCP", NULL},  6 },
  { "egp", (char *[]) { "EGP", NULL},  8 },
  { "igp", (char *[]) { "IGP", NULL},  9 },
  { "pup", (char *[]) { "PUP", NULL},  12 },
  { "udp", (char *[]) { "UDP", NULL},  17 },
  { "hmp", (char *[]) { "HMP", NULL},  20 },
  { "xns-idp", (char *[]) { "XNS-IDP", NULL},  22 },
  { "rdp", (char *[]) { "RDP", NULL},  27 },
  { "iso-tp4", (char *[]) { "ISO-TP4", NULL},  29 },
  { "xtp", (char *[]) { "XTP", NULL},  36 },
  { "ddp", (char *[]) { "DDP", NULL},  37 },
  { "idpr-cmtp", (char *[]) { "IDPR-CMTP", NULL},  38 },
  { "ipv6", (char *[]) { "IPv6", NULL},  41 },
  { "ipv6-route", (char *[]) { "IPv6-Route", NULL},  43 },
  { "ipv6-frag", (char *[]) { "IPv6-Frag", NULL},  44 },
  { "idrp", (char *[]) { "IDRP", NULL},  45 },
  { "rsvp", (char *[]) { "RSVP", NULL},  46 },
  { "gre", (char *[]) { "GRE", NULL},  47 },
  { "esp", (char *[]) { "IPSEC-ESP", NULL},  50 },
  { "ah", (char *[]) { "IPSEC-AH", NULL},  51 },
  { "skip", (char *[]) { "SKIP", NULL},  57 },
  { "ipv6-icmp", (char *[]) { "IPv6-ICMP", NULL},  58 },
  { "ipv6-nonxt", (char *[]) { "IPv6-NoNxt", NULL},  59 },
  { "ipv6-opts", (char *[]) { "IPv6-Opts", NULL},  60 },
  { "rspf", (char *[]) { "RSPF", NULL},  73 },
  { "vmtp", (char *[]) { "VMTP", NULL},  81 },
  { "eigrp", (char *[]) { "EIGRP", NULL},  88 },
  { "ospf", (char *[]) { "OSPFIGP", NULL},  89 },
  { "ax.25", (char *[]) { "AX.25", NULL},  93 },
  { "ipip", (char *[]) { "IPIP", NULL},  94 },
  { "etherip", (char *[]) { "ETHERIP", NULL},  97 },
  { "encap", (char *[]) { "ENCAP", NULL},  98 },
  { "pim", (char *[]) { "PIM", NULL},  103 },
  { "ipcomp", (char *[]) { "IPCOMP", NULL},  108 },
  { "vrrp", (char *[]) { "VRRP", NULL},  112 },
  { "l2tp", (char *[]) { "L2TP", NULL},  115 },
  { "isis", (char *[]) { "ISIS", NULL},  124 },
  { "sctp", (char *[]) { "SCTP", NULL},  132 },
  { "fc", (char *[]) { "FC", NULL},  133 },
  { "udplite", (char *[]) { "UDPLite", NULL},  136 },
  { "mpls-in-ip", (char *[]) { "MPLS-in-IP", NULL},  137 },
  { "manet", (char *[]) { NULL},  138 },
  { "hip", (char *[]) { "HIP", NULL},  139 },
  NULL
};

struct protoent *fake_getprotobyname(const char *name) {
  struct protoent *ptr;
  char **s;

  for (ptr = staticprotoentsp; ptr != NULL && ptr->p_name != NULL; ++ptr) {
    if (strcmp(ptr->p_name, name) == 0) {
      return ptr;
    }
    for (s=ptr->p_aliases; (s != NULL) && (*s != NULL); ++s) {
      if (strcmp(*s, name) == 0) {
	return ptr;
      }
    }
  }
  return NULL;
}

struct protoent *fake_getprotobynumber(int proto) {
  struct protoent *ptr;
  for (ptr = staticprotoentsp; ptr != NULL && ptr->p_name != NULL; ++ptr) {
    if (ptr->p_proto == proto) {
      return ptr;
    }
  }
  return NULL;
}
