FROM registry.access.redhat.com/rhpam-7/rhpam70-businesscentral-openshift:1.2

ADD ./contrib/application-users.properties /opt/eap/standalone/configuration/application-users.properties
ADD ./contrib/application-roles.properties /opt/eap/standalone/configuration/application-roles.properties
ADD ./contrib/deployments/* /opt/eap/standalone/c/
USER root
RUN chown jboss:root /opt/eap/standalone/configuration/application-users.properties && \
			chown jboss:root /opt/eap/standalone/deployments/rhpam-case-mgmt-showcase.war && \
			chmod 664 /opt/eap/standalone/deployments/rhpam-case-mgmt-showcase.war.dodeploy && \
			chmod 664 /opt/eap/standalone/configuration/application-roles.properties
USER jboss
