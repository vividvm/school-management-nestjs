-- CreateTable
CREATE TABLE "roleMaster" (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "schoolId" INTEGER NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "userId" UUID,

    CONSTRAINT "roleMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "designationMaster" (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "schoolId" INTEGER NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "userId" UUID,

    CONSTRAINT "designationMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appModule" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "appModule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "appModulePermission" (
    "id" SERIAL NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "appModuleId" INTEGER NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "appModulePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "schoolAppModule" (
    "id" SERIAL NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "appModuleId" INTEGER NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "schoolAppModule_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userRoleAppModulePermission" (
    "id" SERIAL NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "appModulePermissionId" INTEGER NOT NULL,
    "roleId" UUID NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "userRoleAppModulePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "userAdditionalRoleAppModulePermission" (
    "id" SERIAL NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "appModulePermissionId" INTEGER NOT NULL,
    "userId" UUID NOT NULL,
    "roleId" UUID NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "roleMasterId" UUID,

    CONSTRAINT "userAdditionalRoleAppModulePermission_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "subjectMaster" (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "subjectMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classMaster" (
    "id" UUID NOT NULL,
    "name" VARCHAR(255) NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "classMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classSectionMaster" (
    "id" UUID NOT NULL,
    "section" VARCHAR(255) NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "classId" UUID NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "classSectionMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classSubjectMaster" (
    "id" UUID NOT NULL,
    "subjectId" UUID NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "classSectionId" UUID NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "classSubjectMaster_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "classEducationGroupMaster" (
    "id" UUID NOT NULL,
    "name" TEXT NOT NULL,
    "schoolId" INTEGER NOT NULL,
    "classSectionId" UUID NOT NULL,
    "createdBy" UUID,
    "updatedBy" UUID,
    "createdAt" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updatedAt" TIMESTAMP(3) NOT NULL,
    "isActive" INTEGER NOT NULL DEFAULT 1,

    CONSTRAINT "classEducationGroupMaster_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "roleMaster" ADD CONSTRAINT "roleMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "roleMaster" ADD CONSTRAINT "roleMaster_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "designationMaster" ADD CONSTRAINT "designationMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "designationMaster" ADD CONSTRAINT "designationMaster_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "appModulePermission" ADD CONSTRAINT "appModulePermission_appModuleId_fkey" FOREIGN KEY ("appModuleId") REFERENCES "appModule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schoolAppModule" ADD CONSTRAINT "schoolAppModule_appModuleId_fkey" FOREIGN KEY ("appModuleId") REFERENCES "appModule"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schoolAppModule" ADD CONSTRAINT "schoolAppModule_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schoolAppModule" ADD CONSTRAINT "schoolAppModule_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "schoolAppModule" ADD CONSTRAINT "schoolAppModule_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRoleAppModulePermission" ADD CONSTRAINT "userRoleAppModulePermission_appModulePermissionId_fkey" FOREIGN KEY ("appModulePermissionId") REFERENCES "appModulePermission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRoleAppModulePermission" ADD CONSTRAINT "userRoleAppModulePermission_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRoleAppModulePermission" ADD CONSTRAINT "userRoleAppModulePermission_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRoleAppModulePermission" ADD CONSTRAINT "userRoleAppModulePermission_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userRoleAppModulePermission" ADD CONSTRAINT "userRoleAppModulePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roleMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_appModulePermissionI_fkey" FOREIGN KEY ("appModulePermissionId") REFERENCES "appModulePermission"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_userId_fkey" FOREIGN KEY ("userId") REFERENCES "user"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "userAdditionalRoleAppModulePermission" ADD CONSTRAINT "userAdditionalRoleAppModulePermission_roleId_fkey" FOREIGN KEY ("roleId") REFERENCES "roleMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subjectMaster" ADD CONSTRAINT "subjectMaster_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "subjectMaster" ADD CONSTRAINT "subjectMaster_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classMaster" ADD CONSTRAINT "classMaster_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classMaster" ADD CONSTRAINT "classMaster_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classMaster" ADD CONSTRAINT "classMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSectionMaster" ADD CONSTRAINT "classSectionMaster_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSectionMaster" ADD CONSTRAINT "classSectionMaster_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSectionMaster" ADD CONSTRAINT "classSectionMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSectionMaster" ADD CONSTRAINT "classSectionMaster_classId_fkey" FOREIGN KEY ("classId") REFERENCES "classMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSubjectMaster" ADD CONSTRAINT "classSubjectMaster_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSubjectMaster" ADD CONSTRAINT "classSubjectMaster_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSubjectMaster" ADD CONSTRAINT "classSubjectMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSubjectMaster" ADD CONSTRAINT "classSubjectMaster_classSectionId_fkey" FOREIGN KEY ("classSectionId") REFERENCES "classSectionMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classSubjectMaster" ADD CONSTRAINT "classSubjectMaster_subjectId_fkey" FOREIGN KEY ("subjectId") REFERENCES "subjectMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classEducationGroupMaster" ADD CONSTRAINT "classEducationGroupMaster_createdBy_fkey" FOREIGN KEY ("createdBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classEducationGroupMaster" ADD CONSTRAINT "classEducationGroupMaster_updatedBy_fkey" FOREIGN KEY ("updatedBy") REFERENCES "user"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classEducationGroupMaster" ADD CONSTRAINT "classEducationGroupMaster_schoolId_fkey" FOREIGN KEY ("schoolId") REFERENCES "school"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "classEducationGroupMaster" ADD CONSTRAINT "classEducationGroupMaster_classSectionId_fkey" FOREIGN KEY ("classSectionId") REFERENCES "classSectionMaster"("id") ON DELETE RESTRICT ON UPDATE CASCADE;
