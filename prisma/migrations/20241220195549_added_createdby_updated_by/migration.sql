-- AlterTable
ALTER TABLE "school" ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "updatedBy" UUID;

-- AlterTable
ALTER TABLE "userAddress" ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "updatedBy" UUID;

-- AlterTable
ALTER TABLE "userSchoolMembership" ADD COLUMN     "createdBy" UUID,
ADD COLUMN     "updatedBy" UUID;
