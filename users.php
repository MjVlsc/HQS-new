<?php
// users.php - User Management Page
require("lib/conn.php");

// Initialize $editUser to null to prevent undefined variable warning
$editUser = null;

// Fetch all users with department names
$users = [];
try {
    $stmt = $conn->prepare("
        SELECT u.user_id, u.username, u.role, d.name as department 
        FROM users u 
        LEFT JOIN departments d ON u.dept_id = d.dept_id
        ORDER BY u.user_id ASC
    ");
    $stmt->execute();
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching users: " . $e->getMessage();
}

// Handle soft delete
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    try {
        $stmt = $conn->prepare("UPDATE users SET status = 0 WHERE user_id = :id");
        $stmt->bindParam(':id', $delete_id);
        $stmt->execute();
        
        header("Location: users.php?success=User deleted successfully");
        exit();
    } catch (PDOException $e) {
        header("Location: users.php?error=Error deleting user");
        exit();
    }
}

// Handle edit form submission
if (isset($_POST['btnUpdate'])) {
    $user_id = $_POST['user_id'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    $dept_id = $_POST['dept_id'];
    
    try {
        if (!empty($password)) {
            $password = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $conn->prepare("
                UPDATE users 
                SET username = :username, password = :password, role = :role, dept_id = :dept_id 
                WHERE user_id = :user_id
            ");
            $stmt->bindParam(':password', $password);
        } else {
            $stmt = $conn->prepare("
                UPDATE users 
                SET username = :username, role = :role, dept_id = :dept_id 
                WHERE user_id = :user_id
            ");
        }
        
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':role', $role);
        $stmt->bindParam(':dept_id', $dept_id);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        
        header("Location: users.php?success=User updated successfully");
        exit();
    } catch (PDOException $e) {
        header("Location: users.php?error=Error updating user");
        exit();
    }
}

// Fetch departments for edit form
$departments = [];
try {
    $stmt = $conn->prepare("SELECT dept_id, name FROM departments ORDER BY name ASC");
    $stmt->execute();
    $departments = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching departments: " . $e->getMessage();
}

// Fetch roles for edit form
$roles = [];
try {
    $stmt = $conn->prepare("SHOW COLUMNS FROM users LIKE 'role'");
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($row && preg_match("/^enum\((.*)\)$/", $row['Type'], $matches)) {
        $enumValues = explode(",", $matches[1]);
        foreach ($enumValues as $value) {
            $roles[] = trim($value, "'");
        }
    }
} catch (PDOException $e) {
    echo "Error fetching roles: " . $e->getMessage();
}

// Fetch user data for editing
if (isset($_GET['edit_id'])) {
    $edit_id = $_GET['edit_id'];
    try {
        $stmt = $conn->prepare("SELECT * FROM users WHERE user_id = :id");
        $stmt->bindParam(':id', $edit_id);
        $stmt->execute();
        $editUser = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error fetching user: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - HQS</title>
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">


        <!-- Edit User Modal -->
        <?php if ($editUser): ?>
        <div class="modal fade show" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="false" style="display: block; background-color: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit User: <?= htmlspecialchars($editUser['username']) ?></h5>
                        <a href="users.php" class="btn-close" style="filter: invert(1);"></a>
                    </div>
                    <form method="POST" action="users.php">
                        <div class="modal-body">
                            <input type="hidden" name="user_id" value="<?= $editUser['user_id'] ?>">
                            
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <th width="30%">User ID</th>
                                            <td><?= htmlspecialchars($editUser['user_id']) ?></td>
                                        </tr>
                                        <tr>
                                            <th>Username</th>
                                            <td>
                                                <input type="text" class="form-control" name="username" 
                                                       value="<?= htmlspecialchars($editUser['username']) ?>" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Password</th>
                                            <td>
                                                <div class="position-relative">
                                                    <input type="password" class="form-control" name="password" placeholder="Leave blank to keep current">
                                                </div>
                                                <small class="text-muted">Only enter a password if you want to change it</small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Role</th>
                                            <td>
                                                <select class="form-select" name="role" required>
                                                    <?php foreach ($roles as $roleOption): ?>
                                                        <option value="<?= htmlspecialchars($roleOption) ?>" 
                                                            <?= $editUser['role'] == $roleOption ? 'selected' : '' ?>>
                                                            <?= htmlspecialchars(ucfirst($roleOption)) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Department</th>
                                            <td>
                                                <select class="form-select" name="dept_id" required>
                                                    <option value="">Select Department</option>
                                                    <?php foreach ($departments as $dept): ?>
                                                        <option value="<?= htmlspecialchars($dept['dept_id']) ?>" 
                                                            <?= $editUser['dept_id'] == $dept['dept_id'] ? 'selected' : '' ?>>
                                                            <?= htmlspecialchars($dept['name']) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="users.php" class="btn btn-secondary">Cancel</a>
                            <button type="submit" name="btnUpdate" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>

        <?php endif; ?>
    </div>

    <script>
        function confirmDelete(user_id) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'This user will be deleted.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = `users.php?delete_id=${user_id}`;
                }
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
<?php
// users.php - User Management Page
require("lib/conn.php");

// Initialize $editUser to null to prevent undefined variable warning
$editUser = null;

// Fetch all users with department names
$users = [];
try {
    $stmt = $conn->prepare("
        SELECT u.user_id, u.username, u.role, d.name as department 
        FROM users u 
        LEFT JOIN departments d ON u.dept_id = d.dept_id 
        ORDER BY u.user_id ASC
    ");
    $stmt->execute();
    $users = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching users: " . $e->getMessage();
}

// Handle soft delete
if (isset($_GET['delete_id'])) {
    $delete_id = $_GET['delete_id'];
    try {
        $stmt = $conn->prepare("UPDATE users SET status = 0 WHERE user_id = :id");
        $stmt->bindParam(':id', $delete_id);
        $stmt->execute();
        
        header("Location: users.php?success=User deleted successfully");
        exit();
    } catch (PDOException $e) {
        header("Location: users.php?error=Error deleting user");
        exit();
    }
}

// Handle edit form submission
if (isset($_POST['btnUpdate'])) {
    $user_id = $_POST['user_id'];
    $username = $_POST['username'];
    $password = $_POST['password'];
    $role = $_POST['role'];
    $dept_id = $_POST['dept_id'];
    
    try {
        if (!empty($password)) {
            $password = password_hash($password, PASSWORD_BCRYPT);
            $stmt = $conn->prepare("
                UPDATE users 
                SET username = :username, password = :password, role = :role, dept_id = :dept_id 
                WHERE user_id = :user_id
            ");
            $stmt->bindParam(':password', $password);
        } else {
            $stmt = $conn->prepare("
                UPDATE users 
                SET username = :username, role = :role, dept_id = :dept_id 
                WHERE user_id = :user_id
            ");
        }
        
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':role', $role);
        $stmt->bindParam(':dept_id', $dept_id);
        $stmt->bindParam(':user_id', $user_id);
        $stmt->execute();
        
        header("Location: users.php?success=User updated successfully");
        exit();
    } catch (PDOException $e) {
        header("Location: users.php?error=Error updating user");
        exit();
    }
}

// Fetch departments for edit form
$departments = [];
try {
    $stmt = $conn->prepare("SELECT dept_id, name FROM departments ORDER BY name ASC");
    $stmt->execute();
    $departments = $stmt->fetchAll(PDO::FETCH_ASSOC);
} catch (PDOException $e) {
    echo "Error fetching departments: " . $e->getMessage();
}

// Fetch roles for edit form
$roles = [];
try {
    $stmt = $conn->prepare("SHOW COLUMNS FROM users LIKE 'role'");
    $stmt->execute();
    $row = $stmt->fetch(PDO::FETCH_ASSOC);
    if ($row && preg_match("/^enum\((.*)\)$/", $row['Type'], $matches)) {
        $enumValues = explode(",", $matches[1]);
        foreach ($enumValues as $value) {
            $roles[] = trim($value, "'");
        }
    }
} catch (PDOException $e) {
    echo "Error fetching roles: " . $e->getMessage();
}

// Fetch user data for editing
if (isset($_GET['edit_id'])) {
    $edit_id = $_GET['edit_id'];
    try {
        $stmt = $conn->prepare("SELECT * FROM users WHERE user_id = :id");
        $stmt->bindParam(':id', $edit_id);
        $stmt->execute();
        $editUser = $stmt->fetch(PDO::FETCH_ASSOC);
    } catch (PDOException $e) {
        echo "Error fetching user: " . $e->getMessage();
    }
}
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Management - HQS</title>
    <scrip src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css">
    <style>
         :root {
            --primary-color: #1d3557;
            --secondary-color: #457b9d;
            --accent-color: #4895ef;
            --light-color: #f8f9fa;
            --dark-color: #212529;
            --success-color: #4cc9f0;
            --danger-color:rgb(247, 37, 37);
            --border-radius: 8px;
            --box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
            --transition: all 0.3s ease;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f5f7fa;
            color: var(--dark-color);
        }

        .container {
            max-width: 1200px;
            margin-top: 30px;
        }

        .card {
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            border: none;
            margin-bottom: 30px;
        }

        .card-header {
            background-color: var(--primary-color);
            color: white;
            border-radius: var(--border-radius) var(--border-radius) 0 0 !important;
            padding: 15px 20px;
        }

        .table {
            margin-bottom: 0;
        }

        .table th {
            background-color: #f8f9fa;
            border-top: none;
            font-weight: 600;
        }

        .table-responsive {
            border-radius: 0 0 var(--border-radius) var(--border-radius);
            overflow: hidden;
        }

        .btn-sm {
            padding: 0.25rem 0.5rem;
            font-size: 0.875rem;
        }

        .btn-primary {
            background-color: var(--primary-color);
            border-color: var(--primary-color);
        }

        .btn-primary:hover {
            background-color: var(--secondary-color);
            border-color: var(--secondary-color);
        }

        .btn-danger {
            background-color: var(--danger-color);
            border-color: var(--danger-color);
        }

        .btn-danger:hover {
            background-color: #Ff0000;
            border-color: #Ffcccb;
        }

        .btn-success {
            background-color: var(--success-color);
            border-color: var(--success-color);
        }

        .btn-success:hover {
            background-color: #3ab8d8;
            border-color: #3ab8d8;
        }

        .badge {
            padding: 0.35em 0.65em;
            font-weight: 500;
        }

        .badge-success {
            background-color: var(--success-color);
        }

        .badge-warning {
            background-color: #f4a261;
        }

        .modal-header {
            background-color: var(--primary-color);
            color: white;
        }

        .form-control:focus {
            border-color: var(--accent-color);
            box-shadow: 0 0 0 0.25rem rgba(72, 149, 239, 0.25);
        }

        .password-toggle {
            cursor: pointer;
            position: absolute;
            right: 10px;
            top: 50%;
            transform: translateY(-50%);
        }


        .action-btns {
            white-space: nowrap;
        }

        .add-user-btn {
            margin-bottom: 20px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2><i class="fas fa-users me-2"></i>User Management</h2>
            <a href="register.php" class="btn btn-primary add-user-btn">
                <i class="fas fa-user-plus me-2"></i>Add New User
            </a>
        </div>

        <?php if (isset($_GET['success'])): ?>
            <div class="alert alert-success alert-dismissible fade show" role="alert">
                <?= htmlspecialchars($_GET['success']) ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <?php if (isset($_GET['error'])): ?>
            <div class="alert alert-danger alert-dismissible fade show" role="alert">
                <?= htmlspecialchars($_GET['error']) ?>
                <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
            </div>
        <?php endif; ?>

        <div class="card">
            <div class="card-header d-flex justify-content-between align-items-center">
                <h5 class="mb-0">User List</h5>
                <div>
                    <span class="badge bg-light text-dark">
                        Total Users: <?= count($users) ?>
                    </span>
                </div>
            </div>
            <div class="table-responsive">
                <table class="table table-hover">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>Username</th>
                            <th>Role</th>
                            <th>Department</th>
                            <th>Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <?php foreach ($users as $user): ?>
                            <tr>
                                <td><?= htmlspecialchars($user['user_id']) ?></td>
                                <td><?= htmlspecialchars($user['username']) ?></td>
                                <td>
                                    <span class="badge bg-primary">
                                        <?= htmlspecialchars(ucfirst($user['role'])) ?>
                                    </span>
                                </td>
                                <td><?= htmlspecialchars($user['department'] ?? 'N/A') ?></td>
                                <td class="action-btns">
                                    <a href="users.php?edit_id=<?= $user['user_id'] ?>" class="btn btn-sm btn-primary">
                                        <i class="fas fa-edit"></i> Edit
                                    </a>
                                    <a href="#" class="btn btn-sm btn-danger" 
                                       onclick="confirmDelete(<?= $user['user_id'] ?>)">
                                        <i class="fas fa-trash-alt"></i> Delete
                                    </a>
                                </td>
                            </tr>
                        <?php endforeach; ?>
                    </tbody>
                </table>
            </div>
        </div>

        <!-- Edit User Modal -->
        <?php if ($editUser): ?>
        <div class="modal fade show" id="editModal" tabindex="-1" aria-labelledby="editModalLabel" aria-hidden="false" style="display: block; background-color: rgba(0,0,0,0.5);">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editModalLabel">Edit User: <?= htmlspecialchars($editUser['username']) ?></h5>
                        <a href="users.php" class="btn-close" style="filter: invert(1);"></a>
                    </div>
                    <form method="POST" action="users.php">
                        <div class="modal-body">
                            <input type="hidden" name="user_id" value="<?= $editUser['user_id'] ?>">
                            
                            <div class="table-responsive">
                                <table class="table table-bordered">
                                    <tbody>
                                        <tr>
                                            <th width="30%">User ID</th>
                                            <td><?= htmlspecialchars($editUser['user_id']) ?></td>
                                        </tr>
                                        <tr>
                                            <th>Username</th>
                                            <td>
                                                <input type="text" class="form-control" name="username" 
                                                       value="<?= htmlspecialchars($editUser['username']) ?>" required>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Password</th>
                                            <td>
                                                <div class="position-relative">
                                                    <input type="password" class="form-control" name="password" placeholder="Leave blank to keep current">
                                                </div>
                                                <small class="text-muted">Only enter a password if you want to change it</small>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Role</th>
                                            <td>
                                                <select class="form-select" name="role" required>
                                                    <?php foreach ($roles as $roleOption): ?>
                                                        <option value="<?= htmlspecialchars($roleOption) ?>" 
                                                            <?= $editUser['role'] == $roleOption ? 'selected' : '' ?>>
                                                            <?= htmlspecialchars(ucfirst($roleOption)) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>Department</th>
                                            <td>
                                                <select class="form-select" name="dept_id" required>
                                                    <option value="">Select Department</option>
                                                    <?php foreach ($departments as $dept): ?>
                                                        <option value="<?= htmlspecialchars($dept['dept_id']) ?>" 
                                                            <?= $editUser['dept_id'] == $dept['dept_id'] ? 'selected' : '' ?>>
                                                            <?= htmlspecialchars($dept['name']) ?>
                                                        </option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </td>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <a href="users.php" class="btn btn-secondary">Cancel</a>
                            <button type="submit" name="btnUpdate" class="btn btn-primary">Save Changes</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <?php endif; ?>
    </div>

    <script>
        function confirmDelete(user_id) {
            Swal.fire({
                title: 'Are you sure?',
                text: 'This user will be deleted.',
                icon: 'warning',
                showCancelButton: true,
                confirmButtonText: 'Yes, delete it!',
                cancelButtonText: 'Cancel'
            }).then((result) => {
                if (result.isConfirmed) {
                    window.location.href = `users.php?delete_id=${user_id}`;
                }
            });
        }
    </script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>